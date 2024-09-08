-- Run away from lualine because its flicker issue caught by my OCD
-- most of code below is from MariaSolOs


local M = {}

-- Don't show the command that produced the quickfix list.
vim.g.qf_disable_statusline = 1

--- Keeps track of the highlight groups I've already created.
---@type table<string, boolean>
local statusline_hls = {}

---@param hl string
---@return string
function M.get_or_create_hl(hl)
  local hl_name = "Statusline" .. hl

  if not statusline_hls[hl] then
    -- If not in the cache, create the highlight group using the icon's foreground color
    -- and the statusline's background color.
    local bg_hl = vim.api.nvim_get_hl(0, { name = "StatusLine" })
    local fg_hl = vim.api.nvim_get_hl(0, { name = hl })
    vim.api.nvim_set_hl(0, hl_name, { bg = ("#%06x"):format(bg_hl.bg or 0), fg = ("#%06x"):format(fg_hl.fg or 0) })
    statusline_hls[hl] = true
  end

  return hl_name
end

--- Current mode.
---@return string
function M.mode_component()
  -- Note that: \19 = ^S and \22 = ^V.
  local mode_to_str = {
    ["n"] = "NORMAL",
    ["no"] = "OP-PENDING",
    ["nov"] = "OP-PENDING",
    ["noV"] = "OP-PENDING",
    ["no\22"] = "OP-PENDING",
    ["niI"] = "NORMAL",
    ["niR"] = "NORMAL",
    ["niV"] = "NORMAL",
    ["nt"] = "NORMAL",
    ["ntT"] = "NORMAL",
    ["v"] = "VISUAL",
    ["vs"] = "VISUAL",
    ["V"] = "VISUAL",
    ["Vs"] = "VISUAL",
    ["\22"] = "VISUAL",
    ["\22s"] = "VISUAL",
    ["s"] = "SELECT",
    ["S"] = "SELECT",
    ["\19"] = "SELECT",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["ix"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rc"] = "REPLACE",
    ["Rx"] = "REPLACE",
    ["Rv"] = "VIRT REPLACE",
    ["Rvc"] = "VIRT REPLACE",
    ["Rvx"] = "VIRT REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
  }

  -- Get the respective string to display.
  local mode = mode_to_str[vim.api.nvim_get_mode().mode] or "UNKNOWN"

  -- Set the highlight group.
  local hl = "Other"
  if mode:find("NORMAL") then
    hl = "Normal"
  elseif mode:find("PENDING") then
    hl = "Pending"
  elseif mode:find("VISUAL") then
    hl = "Visual"
  elseif mode:find("INSERT") or mode:find("SELECT") then
    hl = "Insert"
  elseif mode:find("COMMAND") or mode:find("TERMINAL") or mode:find("EX") then
    hl = "Command"
  end

  -- Construct the bubble-like component.
  return table.concat({
    string.format("%%#StatusLineMode%s# ", hl),
    string.format("%%#StatusLineMode%s#%s ", hl, mode),
    string.format("%%#StatusLineModeSeparator%s#", hl),
  })
end

--- Git status (if any).
---@return string
function M.git_component()
  local head = vim.b.gitsigns_head
  if not head then
    return string.format("%%#StatusLineGitSeparator#")
  end

  return table.concat({
    string.format("%%#StatusLineGit#  %s ", head),
    string.format("%%#StatusLineGitSeparator#"),
  })
end

-- Get the icon for the current filetype.
---@param filetype string
---@return string, string
function M.get_icon_by_filetype(filetype)
  local devicons = require("nvim-web-devicons")

  -- Special icons for some filetypes.
  local special_icons = {
    DressingInput = { "󰍩", "Comment" },
    DressingSelect = { "", "Comment" },
    OverseerForm = { "󰦬", "Special" },
    OverseerList = { "󰦬", "Special" },
    fzf = { "", "Special" },
    kitty_scrollback = { "󰄛", "Conditional" },
    lazyterm = { "", "Special" },
  }

  local icon, icon_hl
  if special_icons[filetype] then
    icon, icon_hl = unpack(special_icons[filetype])
  else
    local buf_name = vim.api.nvim_buf_get_name(0)
    local name, ext = vim.fn.fnamemodify(buf_name, ":t"), vim.fn.fnamemodify(buf_name, ":e")

    icon, icon_hl = devicons.get_icon(name, ext)
    if not icon then
      icon, icon_hl = devicons.get_icon_by_filetype(filetype, { default = true })
    end
  end
  icon_hl = M.get_or_create_hl(icon_hl)

  return icon, icon_hl
end

--- The buffer's filetype.
---@return string
function M.filetype_component()
  local filetype = vim.bo.filetype
  if filetype == "" then
    filetype = "[No Name]"
  end

  local icon, icon_hl = M.get_icon_by_filetype(filetype)
  return table.concat({
    string.format("%%#%s#%s %%#StatusLineFiletype#%s", icon_hl, icon, filetype),
    string.format("%%#StatusLineFiletypeSeparator#"),
  })
end

-- Show the filename of the current buffer.
---@return string
function M.filename_component()
  local filename = vim.fn.expand("%:.")
  local filetype = vim.bo.filetype

  local icon, icon_hl = M.get_icon_by_filetype(vim.bo.filetype)
  return string.format(" %%#%s#%s %%#StatusLineTitle#%s", icon_hl, icon, filename)
end

local last_diagnostic_component = ""
--- Diagnostic counts in the current buffer.
---@return string
function M.diagnostics_component()
  -- Use the last computed value if in insert mode.
  -- Lazy uses diagnostic icons, but those aren't errors per se.
  if vim.bo.filetype == "lazy" then
    return ""
  end

  local icons = {
    diagnostics = {
      ERROR = "",
      WARN = "",
      HINT = "",
      INFO = "",
    },
  }

  -- Use the last computed value if in insert mode.
  if vim.startswith(vim.api.nvim_get_mode().mode, "i") then
    return last_diagnostic_component
  end

  local counts = vim.iter(vim.diagnostic.get(0)):fold({
    ERROR = 0,
    WARN = 0,
    HINT = 0,
    INFO = 0,
  }, function(acc, diagnostic)
    local severity = vim.diagnostic.severity[diagnostic.severity]
    acc[severity] = acc[severity] + 1
    return acc
  end)

  local parts = vim
    .iter(counts)
    :map(function(severity, count)
      if count == 0 then
        return nil
      end

      local hl = "Diagnostic" .. severity:sub(1, 1) .. severity:sub(2):lower()
      return string.format("%%#%s#%s %d", M.get_or_create_hl(hl), icons.diagnostics[severity], count)
    end)
    :totable()

  local diagnostics = table.concat(parts, " ")

  -- Only show the diagnostics if there are any.
  last_diagnostic_component = #parts > 0 and string.format(" %%#StatusLineDiagnostics# %s", diagnostics) or ""
  return last_diagnostic_component
end

-- Show the filesize of the current buffer.
---@return string
function M.filesize_component()
  local filesize = vim.fn.getfsize(vim.fn.expand("%:p"))
  local total_lines = vim.api.nvim_buf_line_count(0)

  local filesize_in_kb = filesize / 1024
  local filesize_in_mb = filesize_in_kb / 1024
  local filesize_in_gb = filesize_in_mb / 1024

  local filesize_str = filesize_in_gb > 1 and string.format("%.2f GB", filesize_in_gb)
    or filesize_in_mb > 1 and string.format("%.2f MB", filesize_in_mb)
    or filesize_in_kb > 1 and string.format("%.2f KB", filesize_in_kb)
    or tostring(filesize) .. " B"

  return filesize > 0 and string.format(" %%#StatusLineItalic#%s   %d lines  ", filesize_str, total_lines) or ""
end

--- File-content encoding for the current buffer.
---@return string
function M.encoding_component()
  local encoding = vim.opt.fileencoding:get()
  local fformat = vim.api.nvim_buf_get_option(0, "fileformat")

  return encoding ~= ""
      and table.concat({
        string.format("%%#StatusLineEncoding# %s   %s ", encoding, fformat),
      })
    or ""
end

--- The current line, total line count, and column position.
---@return string
function M.position_component()
  local line = string.format("%3d", vim.fn.line("."))
  local col = string.format("%2d", vim.fn.virtcol("."))

  return table.concat({
    string.format("%%#StatusLinePositionSeparator#"),
    string.format("%%#StatusLinePosition# ln:%s, col:%s", line, col),
  })
end

--- Renders the statusline.
---@return string
function M.render()
  ---@param components string[]
  ---@return string
  local function concat_components(components)
    return vim.iter(components):skip(1):fold(components[1], function(acc, component)
      return #component > 0 and string.format("%s%s", acc, component) or acc
    end)
  end

  return table.concat({
    concat_components({
      M.mode_component(),
      M.git_component(),
      M.filename_component(),
      M.diagnostics_component(),
    }),
    "%#StatusLine#%=",
    concat_components({
      M.filesize_component(),
      M.encoding_component(),
      M.position_component(),
    }),
    " ",
  })
end
vim.o.statusline = "%!v:lua.require'settings.statusline'.render()"

return M
