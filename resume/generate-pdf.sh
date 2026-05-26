#!/bin/bash
# Resume PDF generator
# Usage: ./generate-pdf.sh [--real-contact|-p] {detailed|concise|perception|robotics} output.pdf
#
# Default output keeps obfuscated contact placeholders for web publishing.
# --real-contact, -r, or legacy -p replaces placeholders with real values from
# resume/metadata-private.yaml via contact-filter.lua for private PDFs.

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

USE_REAL_CONTACT=0
if [[ "$1" == "--real-contact" || "$1" == "-r" || "$1" == "-p" ]]; then
  USE_REAL_CONTACT=1
  shift
fi

if [[ -z "$1" || -z "$2" ]]; then
  echo "Usage: $0 [--real-contact|-p] {detailed|concise|perception|robotics} output.pdf" >&2
  exit 1
fi

case "$1" in
  detailed)
    SOURCE_FILE="${SCRIPT_DIR}/../_pages/resume.md"
    ;;
  concise|perception|robotics)
    SOURCE_FILE="${SCRIPT_DIR}/../_pages/resume-${1}.md"
    ;;
  *)
    echo "Unknown resume variant: $1" >&2
    echo "Expected one of: detailed, concise, perception, robotics" >&2
    exit 1
    ;;
esac

if [[ ! -f "$SOURCE_FILE" ]]; then
  echo "Resume source not found: $SOURCE_FILE" >&2
  exit 1
fi

PANDOC_ARGS=(
  "$SOURCE_FILE"
  --from markdown+markdown_attribute
  --lua-filter="${SCRIPT_DIR}/title-filter.lua"
  --pdf-engine=xelatex
  -o "$2"
)

if [[ "$USE_REAL_CONTACT" == "1" ]]; then
  PANDOC_ARGS+=(
    --metadata-file="${SCRIPT_DIR}/metadata-private.yaml"
    --lua-filter="${SCRIPT_DIR}/contact-filter.lua"
  )
fi

pandoc "${PANDOC_ARGS[@]}"
