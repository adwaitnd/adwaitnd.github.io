#!/bin/bash
# Simple resume PDF generator - Usage: ./generate-pdf.sh {detailed|concise} output.pdf

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

pandoc "${SCRIPT_DIR}/../_pages/resume-${1}.md" \
  --metadata-file="${SCRIPT_DIR}/metadata-private.yaml" \
  --lua-filter="${SCRIPT_DIR}/contact-filter.lua" \
  --lua-filter="${SCRIPT_DIR}/title-filter.lua" \
  --pdf-engine=xelatex \
  -o "$2"
