#!/usr/bin/env bash
set -euo pipefail

apptainer build -F tt.sif tt.def
