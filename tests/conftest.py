"""Shared test setup.

Point the port-count registry's learned file at a temporary path before any
test imports spec2maxpat, and for every sync the tests run in a subprocess, so
syncing a Max-saved fixture never writes to the real
scans/maxhelp/maxhelp_port_counts_local.json.
"""
import os
import tempfile

os.environ["C2M_PORT_COUNTS_LOCAL"] = os.path.join(
    tempfile.mkdtemp(prefix="c2m-ports-"), "maxhelp_port_counts_local.json")
