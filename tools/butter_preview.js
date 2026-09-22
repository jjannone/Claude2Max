// Render Butter Markdown headlessly, reusing the package's own stub, so the
// markup in the patch is checked rather than guessed.
const fs = require('fs'), path = require('path'), vm = require('vm');
const PKG = process.argv[2], SRC_FILE = process.argv[3], WIDTH = +(process.argv[4] || 1100);
const SCRIPT = path.join(PKG, 'javascript', 'butter_comment.js');
const TEST = fs.readFileSync(path.join(PKG, 'tests', 'butter_comment_headless.js'), 'utf8');
// take the stub verbatim: everything from `const FONTS` to the end of makeCtx
const start = TEST.indexOf('const FONTS');
const end = TEST.indexOf('let failures = 0');
const stub = TEST.slice(start, end).replace(/^const SCRIPT[\s\S]*?;\n/m, '');
const mod = { fs, vm, SCRIPT, exports: {} };
const fn = new Function('fs', 'vm', 'SCRIPT', 'console', stub + '\nreturn makeCtx;');
const makeCtx = fn(fs, vm, SCRIPT, console);
const BASE = { fontname: "Monaco", fontsize: 10, fontface: 0, textcolor: [0.9,0.9,0.92,1], textjustification: 0 };
const h = makeCtx(BASE, { size: [WIDTH, 2000] });
const text = fs.readFileSync(SRC_FILE, 'utf8');
h.ctx.set_z_text.apply(h.ctx, [text]);   // the same entry point the box attribute uses
h.ctx.paint();
let unknown = h.posts.filter(p => /unknown|not installed|could not/i.test(p));
if (process.env.BC_QUIET) {
  const last = h.ctx.LINES[h.ctx.LINES.length - 1] || {top:0, height:0};
  console.log(Math.ceil((last.top || 0) + (last.height || 0) + 8));
  process.exit(h.posts.filter(p => /unknown|not installed/i.test(p)).length ? 1 : 0);
}
console.log("--- rendered lines ---");
h.ctx.LINES.forEach((l, i) => {
  if (l.tblrow) {
    const cells = l.tblrow.cells.map((c, ci) =>
      '[' + Math.round(l.tblrow.colw[ci]) + 'px] ' +
      c.lines.map(ln => (ln.runs || ln).map(r => {
        const s = r.style || {};
        const tag = [s.bold && 'b', s.italic && 'i', s.mono && 'm', s.color && 'c'].filter(Boolean).join('');
        return tag ? `<${tag}>${r.text}</>` : r.text;
      }).join('')).join(' / '));
    console.log(String(i).padStart(3) + ' | ROW ' + cells.join('  ||  '));
    return;
  }
  if (l.rule) { console.log(String(i).padStart(3) + ' | ---- rule ----'); return; }
  const t = l.runs.map(r => {
    const s = r.style || {};
    const tag = [s.bold && 'b', s.italic && 'i', s.mono && 'm', s.strike && 's',
                 s.color && 'c', s.size && ('sz' + s.size)].filter(Boolean).join('');
    return tag ? `<${tag}>${r.text}</>` : r.text;
  }).join('');
  console.log(String(i).padStart(3) + ' | ' + t);
});
console.log("\nlines:", h.ctx.LINES.length);
console.log("console posts:", h.posts.length ? h.posts : "(none)");
if (unknown.length) { console.log("\n!! UNKNOWN TOKENS:", unknown); process.exitCode = 1; }
