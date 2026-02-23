# Adwait's Homepage

Personal website built with Jekyll and the Minimal Mistakes theme.

## Content Locations

**Main Pages** (`_pages/`)
- `home.md` - Homepage content
- `research.md` - Research page
- `hobbies.md` - Hobbies page
- `resume.md` - Detailed resume
- `resume-concise.md` - Concise resume

**Blog Posts** (`_posts/`)
- Create new posts as `YYYY-MM-DD-title.md`

**Site Configuration**
- `_config.yml` - Site settings, navigation, social links

## Working with the Site

**Local Website Deployment:**
```bash
bundle exec jekyll serve
# Visit http://localhost:4000
```

**Generate Resume PDFs:**
```bash
# Detailed version
pandoc _pages/resume.md --pdf-engine=xelatex -o resume-detailed.pdf

# Concise version
pandoc _pages/resume-concise.md --pdf-engine=xelatex -o resume-concise.pdf
```

See `resume/README.md` for PDF formatting options.
