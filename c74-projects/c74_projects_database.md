# Cycling '74 Projects Database

Searchable catalog of community projects from <https://cycling74.com/projects>.
Source of truth: gallery + per-project pages, scraped via
`enumerate_c74_projects.py`. Status fields mirror
`c74_projects_crawl_state.json`.

**Use this when**: a user asks "is there an existing Max for Live device
that does X?" or "who has built something like Y?" — `grep` the catalog,
return matches with their authors, dates, and external links.

## Status legend

- **free-inline** — patch attached or embedded as MCT in the project page itself. Rare.
- **free (github / m4l / other)** — `website_url` points to free public source. Followable for analysis.
- **free (drive)** — Google Drive / Dropbox / Mega file share. Likely free download.
- **free (dl)** — `/download` in the URL path. Likely a direct download page.
- **free (author)** — author website confirmed-free via lexical scan or known-academic-domain override.
- **author-site** — could not confirm free-vs-commercial without manual eyeball.
- **commercial** — paid store (gumroad, ko-fi, vstopia, simple-machines, ...) or commercial product page.
- **showcase** — no source link, demo/text or YouTube/Vimeo/Bandcamp only.

## Coverage (as of 2026-05-03)

| Pages | Captured | free-inline | free (gh/m4l/drv/dl/author) | author-site | commercial | showcase |
|---|---|---|---|---|---|---|
| 1-21 | 210 | 0 | 37 | 6 | 118 | 49 |

**Total gallery: 1,822 projects across 183 pages of 10. Captured: 210 (~11.5%).**

**Free-extractable yield: 37/210 (~17%)** — split by source:
- 15 GitHub
- 4 MaxForLive.com
- 2 Google Drive
- 1 direct-download URL
- 15 author website (academic/personal, lexically classified or known)

## Observations on the Cycling '74 Projects Gallery

Maintained on each crawl session. These are gallery-shape findings beyond per-project entries.

### 1. The forum_topic axis is uniformly Misc

Every one of the 210 captured projects carries `forum_topic = "Misc"`. Sampled gallery pages 50, 100, 150, and 180 deep also returned 100% Misc. The taxonomy does not distinguish topic at this level — `forum_topic` is **not a useful organizing axis**. The catalog uses year cohort instead.

### 2. Projects rarely embed patches inline

Across all 210 captured projects: **0 inline `patcher` (MCT) blocks, 0 inline `attachment` nodes**. Forum-style inline embedding is essentially absent here. Patches (when free) live at external URLs: GitHub, MaxForLive.com, GitLab, Google Drive, or the author's personal site. This is the primary architectural difference from `c74-forum/` (where MCT travels inline) and `cookbook/` (where patches are page attachments).

### 3. The era split — older = open-source, recent = commercial

The starkest pattern in the data:

| Cohort | Total | Free | Free yield rate |
|---|---|---|---|
| Pages 1-11 — 2024-2026 | 97 | 11 | 11% |
| Pages 12-21 — 2021-2023 | 113 | 26 | 23% |

The older cohort yields **~5× more open-source projects** than the recent cohort. Working hypothesis: as Ableton's Max for Live ecosystem matured, the gallery became a launch surface for paid M4L devices (gumroad, ko-fi, vstopia, simple-machines), whereas the earlier era posted hobbyist / academic / artistic projects with source code more often. Practical implication: deeper-page sampling is the productive direction for free-extractable patch hunting.

### 4. Recent metadata is partial; older metadata is empty

`project_keywords`, `website_url`, `creator_url`, and `location` populate well on 2024+ projects but are absent from many older ones. These appear to be a recent platform addition that was not backfilled. **Do not interpret missing metadata as "no source available"** — it just means the field was added to the platform later. Older projects often link to free patches via `website_url` even when keywords are empty.

### 5. Author concentration — a few prolific posters dominate the recent gallery

| Projects | Author | Pattern |
|---|---|---|
| 17 | Tilman Ehrhorn | commercial M4L sequencer/sampler series (`*sq01-sq10`, `*tape`, `*reso`, `*wave`, `*grain`, `*4-track`, `*control`) — gumroad-only |
| 10 | axers fall | commercial spectral-effects line (Spectral HQ, Ease, SpecTone, Multirev, Phasorgate, Feedcomb, RandStut, 8-step LFO, % bands, TideWater) — split gumroad / ko-fi |
| 10 | Feri G | commercial Drox / Spectral Wobbler / Auren / ChromaPhase / Celium / Evorn series — dystopianwaves.gumroad.com |
| 8 | sam ssaem | commercial M4L line (Low Roller, Currents, Flurry, Jangdan, Pulser, High Roller, Simpler Shuffler, ABBY) — simple-machines.net |
| 7 | Julien Bayle | mixed: VOID series + The Art of Max for Live book (commercial) + works/installations (free showcase) |
| 6 | Capiuz | Drone synth product line — h-4.digital + favaroluca.com |
| 6 | André Rangel | 3kta.net artist project pages (showcase-only — installations/sound art) |
| 5 | weightausend | commercial timestretch/sampler line — ko-fi |
| 5 | Ian Dicke | novelmusic.org M4L line (commercial) |
| 4 | Manifest Audio |  |
| 4 | motoko |  |

A handful of authors generate the bulk of recent commercial entries. **58 of 210 projects are by the top 6 authors alone** (~27%). Removing them, the gallery looks much more diverse and academic.

### 6. Topic clusters by frequency

Top keyword + title-word groupings across the 210:

- **Sequencers** (~25 projects) — Tilman Ehrhorn's sq series alone is 10; plus euclidean / circular / step variants from other authors.
- **Spectral processing** (~15) — axers fall + Feri G dominate; spectral delay, multiband, wobbler, filter.
- **Stutter / glitch / dropout** (~8) — Drox series dominates.
- **Sampler / tape emulation** (~10) — Mini Koi, ClassiCfizer, *tape, PAULA, Modulus, WISE.
- **Generative MIDI / arpeggiator** (~10) — VOID MIDI Random, Meridian, PinkAI, Step Arpeggiator, Molecular, Modulus arp-mode.
- **Granular** (~5) — Celestine, Mini Koi (KS), grain (Tilman).
- **Spatial / multichannel / Ambisonics** (~3) — GROTTA 3D, multichannel tape, irin.

### 7. Notable archive-quality finds

Among the 37 free-extractable, two entries deserve special callout for pedagogical or archival value (native-Max only — Pd-shim and binary-port repos are intentionally excluded):

- **Facet (mjcella)** ([github.com/mjcella/facet](https://github.com/mjcella/facet)) — actively-maintained algorithmic / generative composition system; substantial codebase.
- **MaxZine vol 1** ([github.com/mrtnRivera/MaxZine1_Diccionarios](https://github.com/mrtnRivera/MaxZine1_Diccionarios/releases/tag/v1.0.0)) — Spanish-language Max community fanzine + accompanying patch dictionary; community-knowledge artifact.

Three georgeNikmus repos initially flagged here (Andy Farnell *Designing Sound* port, Miller Puckette *Theory and Technique* port, Linux4Max binaries) are **deferred per 2026-05-04 user decision** — the textbook ports require the `Pd4Max` shim (so they're Pd patches running through a translation layer rather than native-Max designs), and Linux4Max wraps Linux plugin binaries rather than teaching Max idiom. They remain in the catalog rows below for completeness.

### 8. The "author-site-unclassified" residual is small and bounded

After URL-pattern matching + lexical scan + manual academic-domain overrides, only **6 of 210** projects remain genuinely ambiguous. These are 1-off domains where the page either timed out, had no clear buy/free signals, or was an art project page that may or may not link to source. Future sessions can decide per-project whether they're worth a deeper look.

## Free-extractable candidates (priority for analysis pass)

**37 confirmed free-extractable across the 210**, organized by source:

### GitHub — 15

| Title | Author | Source |
|---|---|---|
| [!SHAKE!](https://cycling74.com/projects/shake) | Davor Branimir Vincze | <https://github.com/Vinczius/Shake.git> |
| [Dataset Generator for Musical Devices](https://cycling74.com/projects/dataset-generator-for-musical-devices) | Stefano Fasciani | <https://github.com/stefanofasciani/DGMD> |
| [Dirigera Max](https://cycling74.com/projects/dirigera-max) | Maciek Odro | <https://github.com/maceq687/dirigera-max> |
| [sonus](https://cycling74.com/projects/sonus) | Valerio Orlandini | <https://valeriorlandini.github.io/sonus/> |
| [RNBO Preset Backup](https://cycling74.com/projects/rnbo-preset-backup) | Jan M | <https://github.com/janmech/RNBO_PresetBackup_1.2.1> |
| [Generative Sound Control Interface](https://cycling74.com/projects/generative-sound-control-interface) | michaelpromeo | <https://github.com/nightshining/Mubu_Generative_Sound_Control_Interface> |
| [Circular Sequencer](https://cycling74.com/projects/circular-sequencer) | Michael Reichmann | <https://github.com/michaelreichmann/Circular_Sequencer> |
| [SwiftRNBO](https://cycling74.com/projects/swiftrnbo) | Eldar Sadykov | <https://github.com/ceammc/SwiftRNBO> |
| [MaxZine vol.1 - Un fanzine en español sobre Max](https://cycling74.com/projects/maxzine-vol-1-un-fanzine-en-español-sobre-max) | Martin Olavarria | <https://github.com/mrtnRivera/MaxZine1_Diccionarios/releases/tag/v1.0.0> |
| [transient crossfade](https://cycling74.com/projects/transient-crossfade) | sousastep | <https://github.com/jbaylies/transient_crossfade> |
| [Facet](https://cycling74.com/projects/facet) | reflectwhat | <https://github.com/mjcella/facet> |
| [mc.rtpsendreceive~](https://cycling74.com/projects/mc-rtpsendreceive~) | tomoya matsuura | <https://github.com/tomoyanonymous/rtpsendreceive> |

### MaxForLive.com — 4

| Title | Author | Source |
|---|---|---|
| [Modulus](https://cycling74.com/projects/modulus) | Stephen Black | <https://www.maxforlive.com/library/device/10950/modulus> |
| [PAULA 2.0 - Max for Live A1200/PT2 sampler](https://cycling74.com/projects/paula-20-max-for-live-a1200pt2-sampler) | Ashleigh Fournier-Kelleher | <https://maxforlive.com/library/device/11737/PAULA> |
| [W.I.S.E.](https://cycling74.com/projects/wise-wavetable-integrated-sample-engine) | weightausend | <https://maxforlive.com/library/device/9591/w-i-s-e> |
| [rifflemess](https://cycling74.com/projects/rifflemess) | lazy circuit | <https://maxforlive.com/library/device/9582/rifflemess> |

### Google Drive (file share) — 2

| Title | Author | Source |
|---|---|---|
| [Multiband Madness](https://cycling74.com/projects/multiband-madness) | Árni Halldórsson | <https://drive.google.com/drive/folders/1u_NulzXXXtMp7OV3VlaDuWu_R1918CBl?usp=sharing> |
| [SAPPOROPH SKY MACHINE](https://cycling74.com/projects/sapporoph-sky-machine) | paolo ferraguti | <https://drive.google.com/drive/folders/1a2sgTe0L6-V5bWi0oMAlw2RwtxNEfew0> |

### Direct download URL — 1

| Title | Author | Source |
|---|---|---|
| [11UILayer external](https://cycling74.com/projects/11uilayer-external) | 11OLSEN | <https://11olsen.de/max-msp-externals/download/6-max-msp-externals/30-11uilayer> |

### Author website (free / academic) — 15

| Title | Author | Source |
|---|---|---|
| [Cosmolab – Professional Audio Developer Kit based on Electrosmith's Daisy Seed](https://cycling74.com/projects/cosmolab-professional-audio-developer-kit-based-on-electrosmiths-daisy-seed) | Francesco Mulassano | <https://cosmolab.faselunare.com> |
| [MMM4Live](https://cycling74.com/projects/mmm4live) | Renaud Bougueng | <https://www.metacreation.net/projects/mmm4live> |
| [No Dispositivo](https://cycling74.com/projects/no-dispositivo) | Nicolas Villa | <https://cargocollective.com/nicolasvilla/NO-DISPOSITIVO> |
| [The Pacemaker 1.0](https://cycling74.com/projects/the-pacemaker-10) | Max Epperson | <https://www.maxepperson.com/pacemaker> |
| [ATTRACTORS](https://cycling74.com/projects/attractors) | Julien Bayle | <https://julienbayle.net/works/attractors> |
| [Axoa](https://cycling74.com/projects/axoa) | Francois Weber | <http://hapax84.free.fr/Axoa.html> |
| [In vino vanitas](https://cycling74.com/projects/in-vino-vanitas) | Stefano Scarani | <http://www.stefanoscarani.com/art/fragments/In%20vino%20vanitas/Vino.html> |
| [Audio Scene Player](https://cycling74.com/projects/audio-scene-player) | Steve Valentin | <http://audioplayer.stevevalentin.com> |
| [CRT Flux Phaser](https://cycling74.com/projects/crt-flux-phaser) | James Connolly | <https://jameshconnolly.com/crtfluxphaser> |
| [Ártemis](https://cycling74.com/projects/ártemis) | Stefano Scarani | <http://www.stefanoscarani.com/art/fragments/Artemis/Artemis.html> |
| [Musical applications for students and people with cognitive impairments](https://cycling74.com/projects/musical-applications-for-student-and-people-with-cognitive-impairments) | Matteo Olivo | <https://www.matteoolivo.com/maxapplications_en.html> |
| [xp4l](https://cycling74.com/projects/xp4l) | fraction | <https://www.xp4l.com> |
| [Verklärter Rohr](https://cycling74.com/projects/verklärter-rohr) | jullian | <https://jullianhoff.com/2019/01/11/verklarter-rohr-transfigured-tube/> |
| [The Chrominance Collection](https://cycling74.com/projects/the-chrominance-collection) | Felipe Vareschi | <https://www.felipevareschi.com/chrominance> |
| [IRIN](https://cycling74.com/projects/irin-2018-update) | Carlos Caires | <https://irin.carloscaires.com/> |

## Catalog (210 projects across pages 1-21; gallery total 1,822)

### 2026

| Status | Title | Author | Keywords | Link |
|---|---|---|---|---|
| commercial | [ABLETUBE - Node.js + Max for Live YouTube Streaming Device](https://cycling74.com/projects/abletube-nodejs-max-for-live-youtube-streaming-device) | XTERMINATORAPPS | YouTube, Streaming, Node.js, Max for Live | [xterminatorapps.gumroad.com](https://xterminatorapps.gumroad.com/) |
| commercial | [Dr∞ne](https://cycling74.com/projects/drinfinityne) | Capiuz | Drone, Synthesizer, Ableton Device, Instrument | [h-4.digital](https://h-4.digital/product/droone-hide-device-x15/) |
| commercial | [VOID MIDI RANDOM \| M4L Stochastic melodic engine](https://cycling74.com/projects/void-midi-random-or-m4l-stochastic-melodic-engine) | Julien Bayle | random, max for live, midi effect, max external | [structure-void.com](https://structure-void.com/tools/max-for-live/void-midi-random-m4l/) |
| commercial | [VOID Filter Bob](https://cycling74.com/projects/void-filter-bob) | Julien Bayle | - | [structure-void.com](https://structure-void.com/tools/max-for-live/void-filter-bob-m4l) |
| commercial | [DYNAMIC SPLIT MODULE - WebSampler with 63 Audio Separation models in Ableton](https://cycling74.com/projects/dynamic-split-module-websampler-with-63-audio-separation-models-in-ableton-1) | Ostin Solo | Neural Network, Stem Separator, WebSampler | [vstopia.com](https://vstopia.com/max-for-live-devices/dynamic-split-module) |
| showcase | [Nostalgia Panner](https://cycling74.com/projects/nostalgia-panner) | zac folk | - | - |
| showcase | [Synesthesia](https://cycling74.com/projects/synesthesia) | Oscar Bergqvist | - | - |
| showcase | [Arpeggio](https://cycling74.com/projects/arpeggio) | Emir Baser | - | - |

### 2025

| Status | Title | Author | Keywords | Link |
|---|---|---|---|---|
| free (github) | [Dataset Generator for Musical Devices](https://cycling74.com/projects/dataset-generator-for-musical-devices) | Stefano Fasciani | audio effects, sound synthesizers, dataset, machine learning | [github.com](https://github.com/stefanofasciani/DGMD) |
| free (github) | [!SHAKE!](https://cycling74.com/projects/shake) | Davor Branimir Vincze | virtual shakers, physical modeling, granular imitation, digital instrument design | [github.com](https://github.com/Vinczius/Shake.git) |
| free (m4l) | [PAULA 2.0 - Max for Live A1200/PT2 sampler](https://cycling74.com/projects/paula-20-max-for-live-a1200pt2-sampler) | Ashleigh Fournier-Kelleher | PAULA, Amiga, Max 9, Max for Live | [maxforlive.com](https://maxforlive.com/library/device/11737/PAULA) |
| free (m4l) | [Modulus](https://cycling74.com/projects/modulus) | Stephen Black | - | [maxforlive.com](https://www.maxforlive.com/library/device/10950/modulus) |
| free (author) | [Cosmolab – Professional Audio Developer Kit based on Electrosmith's Daisy Seed](https://cycling74.com/projects/cosmolab-professional-audio-developer-kit-based-on-electrosmiths-daisy-seed) | Francesco Mulassano | daisy, electrosmith, gen~, synth | [cosmolab.faselunare.com](https://cosmolab.faselunare.com) |
| author-site | [SUPER.SYSTEM](https://cycling74.com/projects/supersystem) | Julien Bayle | live performance, jitter, openframeworks, music | [julienbayle.net](https://julienbayle.net/works/super-system/) |
| commercial | [PinkAI HarmonAIzer](https://cycling74.com/projects/pinkai-harmonaizer) | Matthew Barile | - | [4chambersound.com](https://www.4chambersound.com/pinkai-harmonaizer-max-4-live-midi-device/) |
| commercial | [Pendolo](https://cycling74.com/projects/pendolo) | Ostin Solo | - | [ostinsolo.co.uk](https://ostinsolo.co.uk/devices/PENDOLO) |
| commercial | [Low Roller](https://cycling74.com/projects/low-roller) | sam ssaem | Max for Live, Audio Effect | [simple-machines.net](https://simple-machines.net/products/low-roller) |
| commercial | [Currents](https://cycling74.com/projects/currents-1) | sam ssaem | Max for Live, Audio Effect | [simple-machines.net](https://simple-machines.net/products/currents) |
| commercial | [Flurry](https://cycling74.com/projects/flurry) | sam ssaem | Max for Live, Audio Effect, Sequencer, Spectral | [simple-machines.net](https://simple-machines.net/products/flurry) |
| commercial | [Jangdan](https://cycling74.com/projects/jangdan) | sam ssaem | Max for Live, MIDI Device | [simple-machines.net](https://simple-machines.net/products/jangdan) |
| commercial | [Pulser](https://cycling74.com/projects/pulser) | sam ssaem | Max for Live, MIDI Device | [simple-machines.net](https://simple-machines.net/products/pulser) |
| commercial | [High Roller](https://cycling74.com/projects/high-roller) | sam ssaem | Max for Live, Audio Effect | [simple-machines.net](https://simple-machines.net/products/high-roller) |
| commercial | [The Art of Max for Live](https://cycling74.com/projects/the-art-of-max-for-live) | Julien Bayle | book, English, French, Max Certified Trainer | [structure-void.com](https://structure-void.com/the-art-of-max-for-live-book/) |
| commercial | [spectral HQ](https://cycling74.com/projects/spectral-hq) | axers fall | spectral process, fft, experimental, "bitcrusher" | [ko-fi.com](https://ko-fi.com/s/8361b44cf8) |
| commercial | [Meridian - Generative Euclidean sequencer](https://cycling74.com/projects/meridian-generative-euclidean-sequencer) | ianjojo | euclidean, sequencer, generative | [ko-fi.com](https://ko-fi.com/ijoaudio) |
| commercial | [spectral ease](https://cycling74.com/projects/spectral-ease) | axers fall | waveshaper, distortion, M4L, spectral process | [axersfall369.gumroad.com](https://axersfall369.gumroad.com/l/ofcto) |
| commercial | [Pink Pong Generator](https://cycling74.com/projects/pink-pong-generator) | Matthew Barile | midi generator, midi plugin, generative music, pong game | [4chambersound.com](https://4chambersound.com/pink-pong-max-4-live-midi-device/) |
| commercial | [SoundStrokes](https://cycling74.com/projects/soundstrokes) | Johnnyc777 | Movement tracking, Audio Reactive, Digital Painting | [themelodycrafters.com](https://www.themelodycrafters.com/) |
| commercial | [Spectranaut](https://cycling74.com/projects/spectranaut) | ianjojo | ambient, max4live, spectral, reverb | [ko-fi.com](https://ko-fi.com/s/e679d53058) |
| commercial | [Drox Glitch/Stutter audio effect](https://cycling74.com/projects/drox-glitchstutter-audio-effect) | Feri G | Random, Stutter, Glitch, Dropout | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/mdrox) |
| commercial | [Spectral Wobbler](https://cycling74.com/projects/spectral-wobbler) | Feri G | Spectral, Sound design, Spectral modulation, Chorus | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/mwobble) |
| commercial | [Wah Pedal](https://cycling74.com/projects/wah-pedal) | Feri G | Filter, Wah | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/mwahpedal) |
| commercial | [ChromaPhase](https://cycling74.com/projects/chromaphase) | Feri G | Chorus, Audio Effect, multi-Voice, Wow/Flutter | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/m4chromap) |
| commercial | [Max Objects Network Graph](https://cycling74.com/projects/max-objects-network-graph) | Julien Bayle | - | [structure-void.com](https://structure-void.com/max-objects-network/) |
| commercial | [Celium](https://cycling74.com/projects/celium) | Feri G | - | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/m4celium) |
| commercial | [Simpler Shuffler](https://cycling74.com/projects/simpler-shuffler) | sam ssaem | Max for Live, MIDI, Sampler, Sequencer | [simple-machines.net](https://simple-machines.net/products/simpler-shuffler) |
| commercial | [Auren Spectral Delay](https://cycling74.com/projects/auren-spectral-delay) | Feri G | Spectral, spectral delay, sound design | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/mauren) |
| commercial | [Evorn -  Multi LFO Modulator](https://cycling74.com/projects/evorn-multi-lfo-modulator) | Feri G | Max for Live, LFO, Multi LFO, Modulator | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/mevorn) |
| commercial | [Auren Pro - Multiband Spectral Delay](https://cycling74.com/projects/auren-pro-multiband-spectral-delay) | Feri G | Max for Live, Spectral, Spectral Delay, Multiband Delay | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/mauren) |
| commercial | [Drox II](https://cycling74.com/projects/drox-ii) | Feri G | Max for Live, Stutter, Glitch, Dropout | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/droxiif) |
| commercial | [Drox II Pro Stutter Glitch Engine](https://cycling74.com/projects/drox-ii-pro-stutter-glitch-engine) | Feri G | Max for Live, Sound Design, Stutter, Dropout | [dystopianwaves.gumroad.com](https://dystopianwaves.gumroad.com/l/droxiip) |
| commercial | [Celestine v2.0](https://cycling74.com/projects/celestine-v20) | ianjojo | max4live, ambient, granular | [ko-fi.com](https://ko-fi.com/s/076eac37c5) |
| commercial | [Exp. SpecTone](https://cycling74.com/projects/exp-spectone) | axers fall | max for live, experimental, spectral process, sci-fi | [ko-fi.com](https://ko-fi.com/s/d5ce1664b5) |
| commercial | [ABBY (M4L)](https://cycling74.com/projects/abby-m4l) | sam ssaem | Max for Live, M4L, A/B | [simple-machines.net](https://simple-machines.net/products/abby) |
| commercial | [Mini Koi (M4L Karplus Strong Synthesizer)](https://cycling74.com/projects/mini-koi-m4l-karplus-strong-synthesizer) | Massimo Ciancarelli | Synth, Karplus, Strong, Physical | [max1994.gumroad.com](https://max1994.gumroad.com/l/rrczqf) |

### 2024

| Status | Title | Author | Keywords | Link |
|---|---|---|---|---|
| free (github) | [sonus](https://cycling74.com/projects/sonus) | Valerio Orlandini | - | [valeriorlandini.github.io](https://valeriorlandini.github.io/sonus/) |
| free (github) | [Dirigera Max](https://cycling74.com/projects/dirigera-max) | Maciek Odro | - | [github.com](https://github.com/maceq687/dirigera-max) |
| free (author) | [ATTRACTORS](https://cycling74.com/projects/attractors) | Julien Bayle | - | [julienbayle.net](https://julienbayle.net/works/attractors) |
| free (author) | [The Pacemaker 1.0](https://cycling74.com/projects/the-pacemaker-10) | Max Epperson | - | [maxepperson.com](https://www.maxepperson.com/pacemaker) |
| free (author) | [No Dispositivo](https://cycling74.com/projects/no-dispositivo) | Nicolas Villa | - | [cargocollective.com](https://cargocollective.com/nicolasvilla/NO-DISPOSITIVO) |
| free (author) | [MMM4Live](https://cycling74.com/projects/mmm4live) | Renaud Bougueng | - | [metacreation.net](https://www.metacreation.net/projects/mmm4live) |
| commercial | [again. Max package to create seamlessly looping GIFs](https://cycling74.com/projects/again-max-package-to-create-seamlessly-looping-gifs) | TFL | - | [glucose47.gumroad.com](https://glucose47.gumroad.com/l/again) |
| commercial | [Jamshid Jam - setar & electronics](https://cycling74.com/projects/jamshid-jam-setar-and-electronics) | Jean-Francois Charles | - | [jamshidjam.com](https://www.jamshidjam.com) |
| commercial | [BPM Wizard](https://cycling74.com/projects/bpm-wizard) | skewborg | - | [soundmanufacture.net](https://www.soundmanufacture.net/devices/bpm-wizard) |
| commercial | [Big Ghost Prototype - 大鬼原型](https://cycling74.com/projects/big-ghost-prototype) | weightausend | - | [ko-fi.com](https://ko-fi.com/s/dac1743018) |
| commercial | [glideverb](https://cycling74.com/projects/glideverb) | Alex DeGroot | - | [alexdegroot.gumroad.com](https://alexdegroot.gumroad.com/l/glideverb) |
| commercial | [Ultra Chop II](https://cycling74.com/projects/ultra-chop-ii) | weightausend | - | [ko-fi.com](https://ko-fi.com/s/27300c1ba4) |
| commercial | [Max for Live *4-track — Multitracker](https://cycling74.com/projects/max-for-live-4-track-multitracker) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/pxrcx) |
| commercial | [RandStut](https://cycling74.com/projects/randstut) | axers fall | - | [axersfall369.gumroad.com](https://axersfall369.gumroad.com/l/zdradf) |
| commercial | [Max for Live *control — Mappable Multislider](https://cycling74.com/projects/max-for-live-control-mappable-multislider) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/hbpgu) |
| commercial | [SousaFX](https://cycling74.com/projects/sousafx) | sousastep | - | [doc.sousastep.quest](https://doc.sousastep.quest/index.html) |
| commercial | [videoplayer for Ableton Live](https://cycling74.com/projects/videoplayer-for-ableton-live) | Julien Bayle | - | [structure-void.com](https://structure-void.com/outils/videoplayer/) |
| commercial | [Icon Button Designer](https://cycling74.com/projects/icon-button-designer) | rbdev | - | [jornal-rb.uk](https://www.jornal-rb.uk/buttondesigner) |
| commercial | [Max for Live *sq05 — Euclidean Sequencer](https://cycling74.com/projects/max-for-live-sq05-euclidean-sequencer) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/ylonf) |
| commercial | [Max for Live *sq04 — Subdivision Stepper](https://cycling74.com/projects/max-for-live-sq04-subdivision-stepper) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/llbcc) |
| commercial | [Max for Live *sq03 — Polyphonic Step Sequencer](https://cycling74.com/projects/max-for-live-sq03-polyphonic-step-sequencer) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/ocftl) |
| commercial | [Max for Live *sq02 — Pattern Generator](https://cycling74.com/projects/max-for-live-sq02-pattern-generator) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/gysxw) |
| commercial | [Max for Live *sq01 — Step Sequencer](https://cycling74.com/projects/max-for-live-sq01-step-sequencer) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/dkzckr) |
| commercial | [Staircase](https://cycling74.com/projects/staircase) | Ian Dicke | - | [novelmusic.org](https://novelmusic.org/m4l/staircase) |
| commercial | [Max for Live *sq10 — Note Generator](https://cycling74.com/projects/max-for-live-sq10-note-generator) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/irgpmq) |
| commercial | [Max for Live *sq09 — Pattern Randomizer](https://cycling74.com/projects/max-for-live-sq09-pattern-randomizer) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/nkgjdu) |
| commercial | [Max for Live *sq08 — Synchronized Looper](https://cycling74.com/projects/max-for-live-sq08-synchronized-looper) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/fzrjf) |
| commercial | [Max for Live *sq07 — Dynamic Step Sequencer](https://cycling74.com/projects/max-for-live-sq07-dynamic-step-sequencer) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/nauwo) |
| commercial | [Max for Live *sq06 — Variable Step Sequencer](https://cycling74.com/projects/max-for-live-sq06-variable-step-sequencer) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/ryzjux) |
| commercial | [Feedcomb](https://cycling74.com/projects/feedcomb) | axers fall | - | [axersfall369.gumroad.com](https://axersfall369.gumroad.com/l/ngsckw) |
| commercial | [X-Ponder](https://cycling74.com/projects/x-ponder) | Manifest Audio | - | [manifest.audio](https://manifest.audio/x-ponder) |
| commercial | [Adjustable Swing for Live 12](https://cycling74.com/projects/adjustable-swing-for-live-12) | Wind Makes Waves LLC | - | [indmakeswaves.com](https://www.windmakeswaves.com/swing) |
| commercial | [Converser](https://cycling74.com/projects/converser) | Manifest Audio | MIDI Tool, Generator, Max for Live, Call & Response | [manifest.audio](https://manifest.audio/converser) |
| commercial | [ArticulatOR Pro 4.2 -- A Ultimate Articulation Control Toolset M4L Device](https://cycling74.com/projects/articulator-pro-42-a-ultimate-articulation-control-toolset-m4l-device) | Darling Lee | - | [darlinglee.gumroad.com](https://darlinglee.gumroad.com/l/atorp) |
| commercial | [Multirev yaled](https://cycling74.com/projects/multirev-yaled) | axers fall | - | [axersfall369.gumroad.com](https://axersfall369.gumroad.com/l/ymcxy) |
| commercial | [GROTTA 3D](https://cycling74.com/projects/grotta-3d) | Daniele Fabris | #spatialaudio, #spatialinstrument, #Multichannel, #Ambisonics | [outerfields.net](https://www.outerfields.net/libraries/grotta3d/) |
| commercial | [PinkAI Generative Composer: a Modular/Multi-track Max for Live MIDI Generator](https://cycling74.com/projects/pinkai-generative-composer-a-modularmulti-track-max-for-live-midi-generator) | Matthew Barile | - | [4chambersound.com](https://4chambersound.com/pinkai/) |
| commercial | [Trifecta](https://cycling74.com/projects/trifecta) | Manifest Audio | - | [manifest.audio](https://manifest.audio/trifecta) |
| commercial | [TideWater](https://cycling74.com/projects/tidewater) | axers fall | spectral filter, auto filter, sound design | [ko-fi.com](https://ko-fi.com/s/8cfb91af3c) |
| commercial | [ClassiCfizer](https://cycling74.com/projects/classicfizer) | weightausend | timestretch, akai, gen, standalone | [ko-fi.com](https://ko-fi.com/s/f497443b48) |
| commercial | [ClassiCfizer - MaxForLive](https://cycling74.com/projects/classicfizer-maxforlive) | weightausend | sampler, sampling | [ko-fi.com](https://ko-fi.com/s/42151c852c) |
| commercial | [Zwobot](https://cycling74.com/projects/zwobot) | Herr Markant | - | [zwobotmax.com](https://www.zwobotmax.com/) |
| showcase | [Rechteck Fyrkant – If they were the same thing, they were the same thing, but they are not.](https://cycling74.com/projects/rechteck-fyrkant-if-they-were-the-same-thing-they-were-the-same-thing-but-they-are-not) | André Rangel | - | [3kta.net](https://3kta.net/3rechteckfyrkant.php) |
| showcase | [(Des)aceleração](https://cycling74.com/projects/desaceleracao) | André Rangel | - | [3kta.net](https://3kta.net/3desacel.php) |
| showcase | [Tonis](https://cycling74.com/projects/tonis) | André Rangel | - | [3kta.net](https://3kta.net/3tonis.php) |
| showcase | [Um-par – Meeting, Union, Synthesis and Fusion.](https://cycling74.com/projects/um-par-meeting-union-synthesis-and-fusion) | André Rangel | - | [3kta.net](https://3kta.net/3umpar.php) |
| showcase | [pixSound](https://cycling74.com/projects/pixsound) | rrriiikkkyy | - | [vimeo.com](https://vimeo.com/manage/folders/19206575) |
| showcase | [Rubix Generator](https://cycling74.com/projects/rubix-generator) | Liam Fisher | - | [interactive-media-projects.web.app](https://interactive-media-projects.web.app/) |
| showcase | [Ghanta](https://cycling74.com/projects/ghanta) | glittech | - | - |
| showcase | [Antifeedback patch for Behringer X-M consoles](https://cycling74.com/projects/antifeedback-patch-for-behringer-x-m-consoles) | John Kozas | - | - |
| showcase | [MIDI parsing using JavaScript in Max](https://cycling74.com/projects/midi-parsing-using-javascript-in-max) | Sylvia Zhang | - | - |
| showcase | [gtm.markov](https://cycling74.com/projects/gtmmarkov) | George Meikle | - | [youtube.com](https://youtube.com/playlist?list=PLvNKPx9B39fq2S7vGQMf1VOxzu2Vah6KQ&si=B_kvuwodJONgbYLP) |

### 2023

| Status | Title | Author | Keywords | Link |
|---|---|---|---|---|
| free (github) | [MaxZine vol.1 - Un fanzine en español sobre Max](https://cycling74.com/projects/maxzine-vol-1-un-fanzine-en-español-sobre-max) | Martin Olavarria | - | [github.com](https://github.com/mrtnRivera/MaxZine1_Diccionarios/releases/tag/v1.0.0) |
| free (github) | [SwiftRNBO](https://cycling74.com/projects/swiftrnbo) | Eldar Sadykov | - | [github.com](https://github.com/ceammc/SwiftRNBO) |
| free (github) | [Circular Sequencer](https://cycling74.com/projects/circular-sequencer) | Michael Reichmann | - | [github.com](https://github.com/michaelreichmann/Circular_Sequencer) |
| free (github) | [Generative Sound Control Interface](https://cycling74.com/projects/generative-sound-control-interface) | michaelpromeo | - | [github.com](https://github.com/nightshining/Mubu_Generative_Sound_Control_Interface) |
| free (github) | [The Theory and Technique of Electronic Music examples for Max/MSP](https://cycling74.com/projects/the-theoy-and-technique-of-electronic-music-examples-for-maxmsp) | George N. | - | [github.com](https://github.com/georgeNikmus/The-Theory-and-Technique-of-Electronic-Music-Max-Patches) |
| free (github) | [Andy Farnell's Designing Sound examples for Max/MSP](https://cycling74.com/projects/andy-farnell's-designing-sound-examples-for-maxmsp) | George N. | - | [github.com](https://github.com/georgeNikmus/Designing-Sound-Max-Patches) |
| free (github) | [Linux Audio Plugins for Max/MSP](https://cycling74.com/projects/linux-audio-plugins-for-maxmsp) | George N. | - | [github.com](https://github.com/georgeNikmus/Linux4Max) |
| free (github) | [RNBO Preset Backup](https://cycling74.com/projects/rnbo-preset-backup) | Jan M | - | [github.com](https://github.com/janmech/RNBO_PresetBackup_1.2.1) |
| free (m4l) | [rifflemess](https://cycling74.com/projects/rifflemess) | lazy circuit | - | [maxforlive.com](https://maxforlive.com/library/device/9582/rifflemess) |
| free (m4l) | [W.I.S.E.](https://cycling74.com/projects/wise-wavetable-integrated-sample-engine) | weightausend | - | [maxforlive.com](https://maxforlive.com/library/device/9591/w-i-s-e) |
| free (drive) | [Multiband Madness](https://cycling74.com/projects/multiband-madness) | Árni Halldórsson | - | [drive.google.com](https://drive.google.com/drive/folders/1u_NulzXXXtMp7OV3VlaDuWu_R1918CBl?usp=sharing) |
| free (dl) | [11UILayer external](https://cycling74.com/projects/11uilayer-external) | 11OLSEN | - | [11olsen.de](https://11olsen.de/max-msp-externals/download/6-max-msp-externals/30-11uilayer) |
| free (author) | [In vino vanitas](https://cycling74.com/projects/in-vino-vanitas) | Stefano Scarani | - | [stefanoscarani.com](http://www.stefanoscarani.com/art/fragments/In%20vino%20vanitas/Vino.html) |
| free (author) | [Axoa](https://cycling74.com/projects/axoa) | Francois Weber | - | [hapax84.free.fr](http://hapax84.free.fr/Axoa.html) |
| author-site | [[AVP-001] AudioVisualPiece001](https://cycling74.com/projects/avp-001-audiovisualpiece001) | motoko | - | [](https:://www.youtube.com/@motoko.v_s) |
| author-site | [Phasorgate](https://cycling74.com/projects/phasorgate) | axers fall | - | [](axersfall369.gumroad.com/l/ipjko) |
| author-site | [Microtuner](https://cycling74.com/projects/microtuner) | ThomasA | - | [](microtuner.se) |
| commercial | [Travelogue](https://cycling74.com/projects/travelogue) | Ian Dicke | - | [novelmusic.org](https://novelmusic.org/m4l/travelogue) |
| commercial | [AutoSlide](https://cycling74.com/projects/autoslide) | tyler mazaika | - | [zoftloud.gumroad.com](https://zoftloud.gumroad.com/l/autoslide) |
| commercial | [Electronic Music and Sound Design for Max 8 Volume 3](https://cycling74.com/projects/electronic-music-and-sound-design-for-max-8-volume-3) | Maurizio Giri | - | [contemponet.com](https://www.contemponet.com/en/shop/electronic-music-and-sound-design-3/) |
| commercial | [APG NESS](https://cycling74.com/projects/apg-ness) | Damien Jacquet | - | [apg.audio](https://www.apg.audio/en/products/softwares/ness-en/189-ness-en.html) |
| commercial | [SASER for iPhone and iPad](https://cycling74.com/projects/saser-for-iphone-and-ipad) | Ruslan | - | [compositorsoftware.com](https://wwww.compositorsoftware.com/saser) |
| commercial | [NOF-Midi2Patch](https://cycling74.com/projects/nof-midi2patch) | Norman Freund | - | [normanfreund.gumroad.com](https://normanfreund.gumroad.com/l/NOF-Mid2Patch) |
| commercial | [Max for Live *tape_multi  — Multi Channel Tape Loop Emulator](https://cycling74.com/projects/max-for-live-*tape_multi-—-multi-channel-tape-loop-emulator) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/sakuz) |
| commercial | [Max for Live *tape — Tape Loop Emulator](https://cycling74.com/projects/max-for-live-*tape-—-tape-loop-emulator) | Tilman Ehrhorn | - | [tilman-ehrhorn.gumroad.com](https://tilman-ehrhorn.gumroad.com/l/mllaio) |
| commercial | [RadioKnife](https://cycling74.com/projects/radioknife) | Holland Sersen | - | [radioknife.co](https://www.radioknife.co/home) |
| commercial | [Aisles](https://cycling74.com/projects/aisles) | Ian Dicke | - | [novelmusic.org](https://www.novelmusic.org/m4l/aisles) |
| commercial | [Perfect Interval Solver](https://cycling74.com/projects/perfect-interval-solver) | Erik Luo | - | [erikluo.gumroad.com](https://erikluo.gumroad.com/l/PerfectIntervalSolver) |
| commercial | [Compositor NTP](https://cycling74.com/projects/compositor-ntp) | Ruslan | - | [compositorsoftware.com](https://www.compositorsoftware.com/compositor-ntp/) |
| commercial | [Tapes](https://cycling74.com/projects/tapes) | matissev | - | [matissev.gumroad.com](https://matissev.gumroad.com) |
| commercial | [Monsoon by Sonoran Music Devices](https://cycling74.com/projects/monsoon-by-sonoran-music-devices) | Sonoran Music Devices | - | [sonoranmusicdevices.gumroad.com](https://sonoranmusicdevices.gumroad.com/l/monsoon) |
| commercial | [Sektor - Spectral Audio Effect/Looper](https://cycling74.com/projects/sektor-spectral-audio-effectlooper) | David Meyer | - | [davidjohannesmeyer.gumroad.com](https://davidjohannesmeyer.gumroad.com/l/sektor?layout=profile) |
| commercial | [Catch](https://cycling74.com/projects/catch) | Ian Dicke | - | [novelmusic.org](https://novelmusic.org/m4l/catch) |
| commercial | [TBT Track Organizer](https://cycling74.com/projects/tbt-track-organizer) | Trevor being Trevor | - | [trevorbeingtrevor.gumroad.com](https://trevorbeingtrevor.gumroad.com/l/tbtTrackOrganizer) |
| commercial | [GMaudio Squeeze](https://cycling74.com/projects/gmaudio-squeeze) | Robert Koster | - | [robertkgm.gumroad.com](https://robertkgm.gumroad.com/l/gma-squeeze) |
| commercial | [Step Arpeggiator](https://cycling74.com/projects/step-arpeggiator) | Udo R. Bräuna | - | [udorbrauna.gumroad.com](https://udorbrauna.gumroad.com/l/StepArpeggiator) |
| commercial | [X-Translate](https://cycling74.com/projects/x-translate) | Manifest Audio | - | [manifest.audio](https://manifest.audio/x-translate) |
| commercial | [8-steps LFO](https://cycling74.com/projects/8-steps-lfo) | axers fall | - | [axersfall369.gumroad.com](https://axersfall369.gumroad.com/l/jkcsls) |
| commercial | [% bands](https://cycling74.com/projects/percent-bands) | axers fall | - | [axersfall369.gumroad.com](https://axersfall369.gumroad.com/l/zzbyw) |
| showcase | [Flat Bed: Volume 1 - Original Copy](https://cycling74.com/projects/flat-bed-volume-1-original-copy) | Riccardo Carbone | - | [youtube.com](https://youtube.com/playlist?list=PLWpphTWri7NCCzrRl2RtyIxSZ3EOe_5mx) |
| showcase | [beat for solo drum kit](https://cycling74.com/projects/beat-for-solo-drum-kit) | Martin Daigle | - | [youtu.be](https://youtu.be/2KXqug8V1JM) |
| showcase | [[TLP-000] TapeLoopPiece000](https://cycling74.com/projects/-tlp-000-tapelooppiece000) | motoko | - | [youtube.com](https://www.youtube.com/c/motoko-v-s) |
| showcase | [Shakespeare Talkbot with ChatGPT and Jitter](https://cycling74.com/projects/shakespeare-talkbot-with-chatgpt-and-jitter) | Christopher | - | [youtu.be](https://youtu.be/qbTJgspGcfk) |
| showcase | [DDV 909 Librarian](https://cycling74.com/projects/ddv-909-librarian) | sotnickd | - | [909librarian.ddv.com](http://909librarian.ddv.com) |
| showcase | [Sound Objects](https://cycling74.com/projects/sound-objects) | Capiuz | - | [hide.bandcamp.com](https://hide.bandcamp.com/album/sound-objects) |
| showcase | [Flat Bed: Volume 2 - Original Copy](https://cycling74.com/projects/flat-bed-volume-2-original-copy) | Riccardo Carbone | - | [youtube.com](https://www.youtube.com/playlist?list=PLWpphTWri7NBgUYV2NIR8eX9C0NoSMbyZ) |
| showcase | [Quantum](https://cycling74.com/projects/quantum) | a s | - | [cores.cx](https://cores.cx/quantum/) |
| showcase | [2 to 36 equal temperament scale graphically visualized marimba version](https://cycling74.com/projects/if-you-divide-the-octave-equally) | tomoyoshi fuseya | - | [youtube.com](https://www.youtube.com/watch?v=1qxou2dn6-U) |
| showcase | [Cymatics Audiovisualizer](https://cycling74.com/projects/cymatics-audiovisualizer) | Austin Santos | - | - |

### 2022

| Status | Title | Author | Keywords | Link |
|---|---|---|---|---|
| free (github) | [transient crossfade](https://cycling74.com/projects/transient-crossfade) | sousastep | - | [github.com](https://github.com/jbaylies/transient_crossfade) |
| free (drive) | [SAPPOROPH SKY MACHINE](https://cycling74.com/projects/sapporoph-sky-machine) | paolo ferraguti | - | [drive.google.com](https://drive.google.com/drive/folders/1a2sgTe0L6-V5bWi0oMAlw2RwtxNEfew0) |
| free (author) | [Ártemis](https://cycling74.com/projects/ártemis) | Stefano Scarani | Electroacoustic music, Interactive dance, Kinect, sensors | [stefanoscarani.com](http://www.stefanoscarani.com/art/fragments/Artemis/Artemis.html) |
| free (author) | [CRT Flux Phaser](https://cycling74.com/projects/crt-flux-phaser) | James Connolly | - | [jameshconnolly.com](https://jameshconnolly.com/crtfluxphaser) |
| free (author) | [Audio Scene Player](https://cycling74.com/projects/audio-scene-player) | Steve Valentin | - | [audioplayer.stevevalentin.com](http://audioplayer.stevevalentin.com) |
| author-site | [Aura's Interaction with a Trackpad. Projet Qualia](https://cycling74.com/projects/aura's-interaction-with-a-trackpad-projet-qualia) | t00r0p | - | [facebook.com](https://www.facebook.com/events/781681146611926) |
| author-site | [Max image processor](https://cycling74.com/projects/max-image-processor) | proppjones | - | [gmail.com](https://proppjonesstudio@gmail.com) |
| commercial | [Midify](https://cycling74.com/projects/midify) | Martel Martin | - | [midifyx.com](http://midifyx.com/) |
| commercial | [Lambda II](https://cycling74.com/projects/lambda-ii) | Riccardo | M4L, Max for Live, granular synthesis, GEN~ | [isotonikstudios.com](https://isotonikstudios.com/product/lambda-ii/) |
| commercial | [gtm.humaniser](https://cycling74.com/projects/gtm-humaniser) | George Meikle | - | [metrosync.gumroad.com](https://metrosync.gumroad.com/l/humaniser) |
| commercial | [Composition Draftworks (new installment to Shared Software Project)](https://cycling74.com/projects/composition-draftworks-new-installment-to-shared-software-project) | Bill Kleinsasser | - | [kleinsasser.net](http://wkleinsasser.net/distribution/SharedSoftwareProject/Shared_Software_Project.html) |
| commercial | [Simple FM with Molecular Dynamics](https://cycling74.com/projects/simple-fm-with-molecular-dynamics) | Claudio Morgado | - | [grexono.com](https://grexono.com/) |
| commercial | [FREQUIA](https://cycling74.com/projects/frequia) | riotchild | audio education, critical listening, ear training, edtech | [frequia.io](https://frequia.io) |
| commercial | [Stepper 2.00](https://cycling74.com/projects/stepper-2-00) | Denys Suminov | sequencer, step sequencer, midi, midi effect | [dmsc.gumroad.com](https://dmsc.gumroad.com/l/duvys) |
| commercial | [CelloPad](https://cycling74.com/projects/cellopad) | Tim Halloran | - | [tim10000.com](https://www.tim10000.com) |
| commercial | [vsthost](https://cycling74.com/projects/vsthost) | rbdev | - | [zaamedia.uk](https://www.zaamedia.uk/vsthost) |
| showcase | [Spirits - Voices from Heavens and Underworlds](https://cycling74.com/projects/spirits-voices-from-heavens-and-underworlds) | Morgan Edgerton | - | - |
| showcase | [Buffer Delay](https://cycling74.com/projects/buffer-delay) | Fernando ARAUZ | - | - |
| showcase | [Coucou Bird Cadenzas:  Improvisations for solo Instruments and Computer](https://cycling74.com/projects/coucou-bird-cadenzas-improvisations-for-solo-instruments-and-computer) | Carl Winter | - | [carlwinter.bandcamp.com](https://carlwinter.bandcamp.com/album/coucou-bird-cadenzas-improvisations-for-solo-instruments-and-computer) |
| showcase | [Chrysalis](https://cycling74.com/projects/chrysalis) | rrriiikkkyy | - | [errorgrid.bandcamp.com](https://errorgrid.bandcamp.com/album/chrysalis) |
| showcase | [Vela](https://cycling74.com/projects/vela) | Capiuz | - | [hide.bandcamp.com](https://hide.bandcamp.com/merch/vela-hide-device-x07) |
| showcase | [The Intervallic Demon](https://cycling74.com/projects/the-intervallic-demon) | Joel Fairstein | - | [youtu.be](https://youtu.be/laolaXuJbRU) |
| showcase | [PV_Tools](https://cycling74.com/projects/pv_tools) | Panayiotis Velianitis | - | - |
| showcase | [Intervallic Demon with piano](https://cycling74.com/projects/intervallic-demon-with-piano) | Joel Fairstein | - | [youtu.be](https://youtu.be/qWNenCF4qnE) |
| showcase | [Fluid](https://cycling74.com/projects/fluid) | Arthur Sauer | - | [arthursauer.bandcamp.com](https://arthursauer.bandcamp.com/album/fluid) |
| showcase | [VisualMIX](https://cycling74.com/projects/visualmix) | Enrico Gazzetto | - | - |
| showcase | [The Earth Organ](https://cycling74.com/projects/the-earth-organ) | soundslikelind | - | [youtu.be](https://youtu.be/Fl9EyMp_7xk) |
| showcase | [Al-kimiya (Live Coded Album)](https://cycling74.com/projects/al-kimiya-live-coded-album) | tmhglnd | - | [timohoogland.bandcamp.com](https://timohoogland.bandcamp.com/album/al-kimiya) |
| showcase | [Krynn](https://cycling74.com/projects/krynn) | Capiuz | - | [hide.bandcamp.com](https://hide.bandcamp.com/merch/krynn-hide-device-x09) |
| showcase | [[AVP-000] AudioVisualPiece000](https://cycling74.com/projects/-avp-000-audiovisualpiece000) | motoko | - | [youtube.com](https://www.youtube.com/c/motoko-v-s) |

### 2021

| Status | Title | Author | Keywords | Link |
|---|---|---|---|---|
| free (github) | [mc.rtpsendreceive~](https://cycling74.com/projects/mc-rtpsendreceive~) | tomoya matsuura | - | [github.com](https://github.com/tomoyanonymous/rtpsendreceive) |
| free (github) | [Facet](https://cycling74.com/projects/facet) | reflectwhat | - | [github.com](https://github.com/mjcella/facet) |
| free (author) | [IRIN](https://cycling74.com/projects/irin-2018-update) | Carlos Caires | Micromontage, Concatenative synthesis, Multiscale, Audio sequencer | [irin.carloscaires.com](https://irin.carloscaires.com/) |
| free (author) | [The Chrominance Collection](https://cycling74.com/projects/the-chrominance-collection) | Felipe Vareschi | - | [felipevareschi.com](https://www.felipevareschi.com/chrominance) |
| free (author) | [Verklärter Rohr](https://cycling74.com/projects/verklärter-rohr) | jullian | - | [jullianhoff.com](https://jullianhoff.com/2019/01/11/verklarter-rohr-transfigured-tube/) |
| free (author) | [xp4l](https://cycling74.com/projects/xp4l) | fraction | - | [xp4l.com](https://www.xp4l.com) |
| free (author) | [Musical applications for students and people with cognitive impairments](https://cycling74.com/projects/musical-applications-for-student-and-people-with-cognitive-impairments) | Matteo Olivo | - | [matteoolivo.com](https://www.matteoolivo.com/maxapplications_en.html) |
| commercial | [Max for Live *grain — Granular Sampler](https://cycling74.com/projects/max-for-live-*grain-—-granular-sampler) | Tilman Ehrhorn | GRANULAR SYNTHESIS, SAMPLER, POLYPHONY | [gum.co](https://gum.co/OojK) |
| commercial | [DSI Tetr4 editor](https://cycling74.com/projects/dsi-tetr4-editor) | Marco Cinque | DSI, Tetra, Tetr4, NRPN | [marcocinque.net](https://www.marcocinque.net/page/dsi-tetra-editor-max/) |
| commercial | [MOLECULAR – Mutative Arpeggiator – Max for Live](https://cycling74.com/projects/molecular-–-mutative-arpeggiator-–-max-for-live) | Roland Sproll | - | [mididope.com](https://www.mididope.com/molecular/) |
| commercial | [SAE Mackie 1604VLZ4 Simulator](https://cycling74.com/projects/sae-mackie-1604vlz4-simulator) | riotchild | - | [sae.edu.au](https://sae.edu.au/showcase/software/) |
| commercial | [Dispatch v1.0 - A global modulation matrix for Live 10 & 11](https://cycling74.com/projects/dispatch-v1-0-a-global-modulation-matrix-for-live-10-11) | Cong Burn | - | [congburn.co.uk](https://www.congburn.co.uk/dispatch) |
| commercial | [Gr4imulator](https://cycling74.com/projects/gr4imulator) | Daniele Fabris | - | [danielefabris.com](https://www.danielefabris.com/gr4imulator/) |
| commercial | [Max for Live *wave — Wavetable Synth](https://cycling74.com/projects/max-for-live-*wave-—-wavetable-synth) | Tilman Ehrhorn | Synthesizer, Wavetable, Waveshaping, Frequency Modulation# | [gum.co](https://gum.co/ukjrj) |
| commercial | [iLov NF-1](https://cycling74.com/projects/ilov-nf-1) | ludo lov | - | [gumroad.com](https://gumroad.com/l/ilovnf1) |
| commercial | [Yofiel synth and gen~ DSP library](https://cycling74.com/projects/yofiel-synth-and-gen~-dsp-library) | Ernest | - | [yofiel.com](https://www.yofiel.com/max.php) |
| commercial | [Max for Live *reso — Resonator Synth](https://cycling74.com/projects/max-for-live-*reso-—-resonator-synth) | Tilman Ehrhorn | Physical Modelling, Synthesizer, Resonator, Wind Instrument | [gum.co](https://gum.co/XnXnls) |
| commercial | [SEEDS](https://cycling74.com/projects/seeds) | Ian Dicke | - | [novelmusic.org](https://novelmusic.org/m4l/seeds) |
| commercial | [SynthCore gen~ library Filter and EQ supplements](https://cycling74.com/projects/synthcore-gen~-library-filter-and-eq-supplements) | Ernest | - | [yofiel.com](https://yofiel.com/audio/synthcore.php) |
| commercial | [gtm.MIDIdrone](https://cycling74.com/projects/gtm-mididrone) | George Meikle | - | [metrosync.gumroad.com](https://metrosync.gumroad.com/l/mididrone) |
| commercial | [GROTTA Granular Texturizer](https://cycling74.com/projects/grotta-granular-texturizer) | Daniele Fabris | - | [outerfields.net](https://www.outerfields.net/libraries/grotta/) |
| commercial | [LaserImpro](https://cycling74.com/projects/laserimpro) | JesterN | - | [jestern.gumroad.com](https://jestern.gumroad.com/l/WhRur) |
| showcase | [AfterMath](https://cycling74.com/projects/aftermath) | Oa Catus | - | [uclmal.com](https://www.uclmal.com/exhibition?pgid=kq1927vp-1ea70967-1ac6-4e1b-9653-0eea5ed43eeb) |
| showcase | [Musics using self-made Max patches for composing n equal temperament music](https://cycling74.com/projects/musics-using-self-made-max-patches-for-composing-n-equal-temperament-music) | tomoyoshi fuseya | - | - |
| showcase | [Moving Towards Synchrony](https://cycling74.com/projects/moving-towards-synchrony) | Johnny Tomasiello | - | [youtube.com](https://www.youtube.com/watch?v=TYoxibXyLYQ) |
| showcase | [URL_1](https://cycling74.com/projects/url_1) | Capiuz | - | [hide.bandcamp.com](https://hide.bandcamp.com/album/url-1) |
| showcase | [Pendulum 2021](https://cycling74.com/projects/pendulum-2021) | Rack | - | - |
| showcase | [Cicada](https://cycling74.com/projects/cicada) | Capiuz | - | [unizone.bandcamp.com](https://unizone.bandcamp.com/album/confined-space) |
| showcase | [Sail -  Synchronous As In Life](https://cycling74.com/projects/sail-synchronous-as-in-life) | André Rangel | - | [3kta.net](http://3kta.net/3sail.php) |
| showcase | [A Mar (The Sea, To Love)](https://cycling74.com/projects/a-mar-the-sea-to-love) | André Rangel | - | [3kta.net](http://3kta.net/3amar.php) |
| showcase | [Spatial Instrument](https://cycling74.com/projects/spatial-instrument) | Ricardo Thomasi | - | - |
| showcase | [Feedback control for performing with audible ecosystem](https://cycling74.com/projects/feedback-control-for-performing-with-audible-ecosystem) | Ricardo Thomasi | acoustic ecology, audible ecosystem, feedback system, positive feedback | [zenodo.org](https://zenodo.org/record/5649265#.YZU1omDMKrw) |
| showcase | [Ambient Image controller and projector](https://cycling74.com/projects/ambient-image-controller-and-projector) | proppjones | - | - |
| showcase | [a10](https://cycling74.com/projects/a10) | motoko | - | [youtube.com](https://www.youtube.com/c/motoko-v-s) |

## Notes on classification

- All 210 projects carry `forum_topic = "Misc"` — confirmed across pages 1-21 plus deep samples at 50, 100, 150, 180.
- 0 inline patches across all 210. Inline `patcher` / `attachment` ProseMirror nodes are essentially unused on the projects gallery.
- Recent metadata (`project_keywords`, `website_url`, `creator_url`, `location`) populates well on 2024+ projects, sparsely on 2023, and not at all on much-older pages — these fields are a recent platform addition that wasn't backfilled.
- Many `*.gumroad.com` URLs include leading whitespace in the gallery data; the classifier strips it before parsing. (Also surfaced as a real bug in the original page-1 capture: 5 Tilman Ehrhorn URLs had leading spaces.)
- Slugs containing non-ASCII characters (em-dash, accented Latin, Spanish ñ) need URL-percent-encoding before fetch — `enumerate_c74_projects.py` was patched 2026-05-03 to handle this; older runs would have fallen back to listing-page metadata only.
