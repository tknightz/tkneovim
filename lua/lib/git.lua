local E = {}

function init()
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
        return { 'bat', '--style=plain', entry.value }
      end

      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
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
      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value, current_file }
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
      if entry.status == '??' then
        -- return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
        return { 'bat', '--style=plain', entry.value }
      end

      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
    end
  }

  opts = opts or {}
  opts.previewer = delta

  config.builtin.git_status(opts)
end

return E
