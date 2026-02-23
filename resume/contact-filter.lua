-- Pandoc Lua filter to replace contact information patterns
-- Replaces puzzle text with real values from metadata during PDF generation

local contact_meta = {}

function Meta(meta)
  -- Capture contact metadata for use in Str function
  if meta.contact then
    contact_meta = meta.contact
  end
  return meta
end

function Str(elem)
  if not contact_meta or not contact_meta.email then
    return elem
  end

  local text = elem.text

  -- Replace location pattern
  if contact_meta.location and text:match("Palo Alto, CA") then
    text = text:gsub("Palo Alto, CA", pandoc.utils.stringify(contact_meta.location))
  end

  -- Replace email pattern
  -- Note: Pandoc processes \+ in markdown as just +, so we match the processed form
  if contact_meta.email and text:match("FirstNameAbbreviated") then
    -- The %+ is escaped because + has special meaning in Lua patterns
    text = text:gsub("FirstNameAbbreviated%+n%+LastName@gmail.com",
      pandoc.utils.stringify(contact_meta.email))
  end

  -- Replace phone pattern (user will add their puzzle pattern here when they add phone to resume)
  -- Example: if contact_meta.phone and text:match("YOUR_PHONE_PUZZLE_PATTERN") then
  --   text = text:gsub("YOUR_PHONE_PUZZLE_PATTERN", pandoc.utils.stringify(contact_meta.phone))
  -- end

  -- Only return new element if text changed
  if text ~= elem.text then
    return pandoc.Str(text)
  end

  return elem
end

-- Return the filters in the correct order
-- Meta must be processed before Str, so we use a multi-pass approach
return {
  { Meta = Meta },  -- First pass: capture metadata
  { Str = Str }     -- Second pass: do replacements
}
