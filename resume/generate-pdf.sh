#!/bin/bash
# Resume PDF generator
# Usage: ./generate-pdf.sh [-p] {detailed|concise} output.pdf
#
# -p  Replace contact info with obfuscated placeholders (for web publishing)
#     Omit for a full-detail PDF (for printing/emailing)

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

PRIVATE=0
if [[ "$1" == "-p" ]]; then
  PRIVATE=1
  shift
fi

PANDOC_ARGS=(
  "${SCRIPT_DIR}/../_pages/resume-${1}.md"
  --from markdown+markdown_attribute
  --lua-filter="${SCRIPT_DIR}/title-filter.lua"
  --pdf-engine=xelatex
  -o "$2"
)

if [[ "$PRIVATE" == "1" ]]; then
  PANDOC_ARGS+=(
    --metadata-file="${SCRIPT_DIR}/metadata-private.yaml"
    --lua-filter="${SCRIPT_DIR}/contact-filter.lua"
  )
fi

pandoc "${PANDOC_ARGS[@]}"
