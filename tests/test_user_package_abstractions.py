"""An abstraction in a user package is on Max's search path, so the convert
gate must accept it by name — including when the package folder is a symlink,
as Butter_tools is. Before 2026-09-25 only the Max install and the repo were
scanned, and `butter_hid` was blocked as an invented name."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat  # noqa: E402


def test_abstraction_in_a_symlinked_user_package_is_found(tmp_path, monkeypatch):
    real = tmp_path / "real_pkg"
    (real / "patchers").mkdir(parents=True)
    (real / "patchers" / "zz_test_abstraction.maxpat").write_text("{}")
    packages = tmp_path / "Packages"
    packages.mkdir()
    (packages / "zz_pkg").symlink_to(real, target_is_directory=True)
    monkeypatch.setattr(spec2maxpat.RefpageCache, "_USER_PACKAGE_ROOTS", [packages])

    r = spec2maxpat.build_resolver()
    assert r is not None
    assert r.abstraction_exists("zz_test_abstraction")
    assert not r.abstraction_exists("zz_not_there_abstraction")
