_G.uppercase_with_condition = function(keyword)
  -- Get the column position and calculate if it's the first word in the line
  local col = vim.fn.col(".")
  local is_first_of_line = col - #keyword <= 1
  -- Return the keyword in uppercase if it's the first word, else return it as is
  return is_first_of_line and keyword:upper() or keyword
end

-- Define a list of keywords
local keywords = {
  "from",
  "maintainer",
  "run",
  "cmd",
  "label",
  "expose",
  "env",
  "add",
  "copy",
  "entrypoint",
  "volume",
  "user",
  "workdir",
  "arg",
  "onbuild",
  "stopsignal",
  "healthcheck",
  "shell",
}

-- Create the abbreviation mappings
for _, keyword in ipairs(keywords) do
  vim.cmd(string.format([[iabbrev <expr> <buffer> %s v:lua.uppercase_with_condition('%s')]], keyword, keyword))
end
