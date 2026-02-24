-- Pandoc Lua filter to remove the page title when generating PDFs
-- This allows the title to show in Jekyll web pages but not in PDF output
--
-- The title metadata in the YAML front matter is used by Jekyll to display
-- the page title, but we want to suppress it in PDF generation to save space
-- and avoid redundancy (since the name "Adwait Dongare" is already present).
--
-- Usage in pandoc command:
--   pandoc resume.md --lua-filter=title-filter.lua -o resume.pdf

function Meta(meta)
  -- Remove the title field from metadata when processing with Pandoc
  -- This prevents Pandoc from rendering the title in the PDF
  meta.title = nil
  return meta
end

-- TODO: add documentation
function Div(el)
  if el.classes:includes("jekyll-only") then
    return {}
  end
  if el.classes:includes("pdf-only") then
    return el.content
  end
end
