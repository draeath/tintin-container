#!/usr/bin/env bash
set -euo pipefail

apptainer build --mksquashfs-args "-comp gzip -Xcompression-level 6" -F tt.sif tt.def
