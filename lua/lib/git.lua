local lib = require("lib")

local E = {}

local function exec(command)
  local f = io.popen(command)
  if f == nil then
    return ""
  end

  local l = f:read("*a")
  f:close()
  return l
end

local function get_git_root()
  local raw_git_root = exec("git rev-parse --show-toplevel")
  local git_root = raw_git_root:gsub("\n[^\n]*$", "")
  return git_root
end

local function init()
  lib.load_module("telescope")
  local previewers = require("telescope.previewers")
  local builtin = require("telescope.builtin")

  return {
    builtin = builtin,
    previewers = previewers,
  }
end

E.my_git_commits = function(opts)
  local config = init()

  local delta = config.previewers.new_termopen_previewer({
    get_command = function(entry)
      -- this is for status
      -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
      -- just do an if and return a different command
      if entry.status == "??" then
        -- return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
        return { "bat", "--style=plain", "--pager", "less -R", entry.value }
      end

      return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "show", entry.value }
    end,
  })

  opts = opts or {}
  opts.previewer = delta

  config.builtin.git_commits(opts)
end

E.my_git_bcommits = function(opts)
  local config = init()
  local current_file = vim.fn.expand("%")

  local delta = config.previewers.new_termopen_previewer({
    get_command = function(entry)
      return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "show", entry.value, current_file }
    end,
  })

  opts = opts or {}
  opts.previewer = delta

  config.builtin.git_bcommits(opts)
end

E.my_git_status = function(opts)
  local config = init()
  local git_root = get_git_root()

  local delta = config.previewers.new_termopen_previewer({
    get_command = function(entry)
      -- this is for status
      -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
      -- just do an if and return a different command
      if entry.status == " D" then
        return
      end

      if entry.status == "??" then
        return { "bat", "--style=plain", "--pager", "less -R", git_root .. "/" .. entry.value }
      end

      return {
        "git",
        "-c",
        "core.pager=delta",
        "-c",
        "delta.side-by-side=false",
        "diff",
        git_root .. "/" .. entry.value,
      }
    end,
  })

  opts = opts or {}
  opts.previewer = delta

  config.builtin.git_status(opts)
end

E.my_git_stash = function(opts)
  local config = init()

  local delta = config.previewers.new_termopen_previewer({
    get_command = function(entry)
      return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "stash", "show", "-p", entry.value }
    end,
  })

  opts = opts or {}
  opts.previewer = delta

  config.builtin.git_stash(opts)
end

return E
