# Resume Generator

## Source Files
- `_pages/resume.md` - Detailed resume version
- `_pages/resume-concise.md` - Concise resume version

## Generating Outputs

### Jekyll (Web)
```bash
bundle exec jekyll serve
# Visit /resume/ for detailed version
# Visit /resume-concise/ for concise version
```

### Pandoc (PDF)

Both versions use identical formatting settings (defined in YAML front matter):

```bash
# Quick method using the script
./resume/generate-pdf.sh concise resume-concise.pdf
./resume/generate-pdf.sh detailed resume-detailed.pdf

# Or manually with pandoc:
# Detailed PDF
pandoc _pages/resume.md \
  --metadata-file=resume/metadata-private.yaml \
  --lua-filter=resume/contact-filter.lua \
  --lua-filter=resume/title-filter.lua \
  --pdf-engine=xelatex \
  -o resume-detailed.pdf

# Concise PDF
pandoc _pages/resume-concise.md \
  --metadata-file=resume/metadata-private.yaml \
  --lua-filter=resume/contact-filter.lua \
  --lua-filter=resume/title-filter.lua \
  --pdf-engine=xelatex \
  -o resume-concise.pdf
```

**One-time setup:** Edit `resume/metadata-private.yaml` with your real contact information (this file is NOT in git). See "Private Contact Information" section below.

## Private Contact Information

The resume markdown files contain puzzle/obfuscated contact info that displays on the web. When generating PDFs, these puzzles are replaced with your real contact information.

### Setup (One-Time)

1. Edit `resume/metadata-private.yaml` with your real contact info:
   ```yaml
   contact:
     location: "Your City, State"
     email: "your.real.email@example.com"
     phone: "+1 (123) 456-7890"  # Optional
     website: "https://yourwebsite.com"
     linkedin: "https://linkedin.com/in/yourprofile"
   ```

2. Update `resume/contact-filter.lua` if you change puzzle patterns in your resume

3. Verify the private file is excluded from git:
   ```bash
   git check-ignore resume/metadata-private.yaml
   # Should output: resume/metadata-private.yaml
   ```

### How It Works

1. **Web (Jekyll):** Shows puzzle versions as written in markdown files, displays page title from YAML front matter
2. **PDF (Pandoc):**
   - `contact-filter.lua` replaces puzzle text with real values from metadata-private.yaml
   - `title-filter.lua` removes the page title to save space (name is already in the document)
3. **Private file:** Protected by .gitignore, never committed to git

## PDF Formatting

Formatting is controlled via YAML front matter in each resume file:
- `geometry: margin=0.75in` - Page margins
- `fontsize: 11pt` - Base font size
- `linestretch: 1.0` - Line spacing (1.0 = single spacing)
- `mainfont: Helvetica Neue` - Font family
- `documentclass: article` - Document class

Edit these values in the YAML section of each file to customize appearance.


