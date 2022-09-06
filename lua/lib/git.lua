local lib = require("lib")

local E = {}

function init()
  lib.load_module('telescope')
  local previewers = require('telescope.previewers')
  local builtin = require('telescope.builtin')

  return {
    builtin = builtin,
    previewers = previewers
  }
end

E.my_git_commits = function(opts)
  local config = init()

  local delta = config.previewers.new_termopen_previewer {
    get_command = function(entry)
      -- this is for status
      -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
      -- just do an if and return a different command
      if entry.status == '??' then
        -- return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
        return { 'bat', '--style=plain', '--pager', 'less -R', entry.value }
      end

      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'show', entry.value }
    end
  }

  opts = opts or {}
  opts.previewer = delta

  config.builtin.git_commits(opts)
end

E.my_git_bcommits = function(opts)
  local config = init()
  local current_file = vim.fn.expand('%')

  local delta = config.previewers.new_termopen_previewer {
    get_command = function(entry)
      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'show', entry.value, current_file }
    end
  }

  opts = opts or {}
  opts.previewer = delta

  config.builtin.git_bcommits(opts)
end

E.my_git_status = function(opts)
  local config = init()

  local delta = config.previewers.new_termopen_previewer {
    get_command = function(entry)
      -- this is for status
      -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
      -- just do an if and return a different command
      if entry.status == ' D' then
        return
      end

      -- print(vim.inspect(entry.status))

      if entry.status == '??' then
        return { 'bat', '--style=plain', '--pager', 'less -R', entry.path }
      elseif entry.status == "MM" then
        return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', '--staged', entry.path }
      end

      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.path }
    end
  }

  opts = opts or {}
  opts.previewer = delta

  config.builtin.git_status(opts)
end

E.my_git_stash = function(opts)
  local config = init()

  local delta = config.previewers.new_termopen_previewer {
    get_command = function(entry)
      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'stash', 'show', entry.value }
    end
  }

  opts = opts or {}
  opts.previewer = delta

  config.builtin.git_stash(opts)
end

return E
