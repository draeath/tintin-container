#!/usr/bin/env bash
set -euo pipefail

apptainer build --mksquashfs-args "-comp lzo" -F tt.sif tt.def
