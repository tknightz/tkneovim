local M = {}

function exportTo(exporter, type)
  local types = {
    markdown = '.md',
    html = '.html',
    org = '.org',
    pdf = '.pdf'
  }

  local current_file = vim.api.nvim_buf_get_name(0)
  local target = vim.fn.fnamemodify(current_file, ':p:r').. types[type]
  local command = {'pandoc', current_file, '-o', target}
  local on_success = function(output)
    print('Success!')
    vim.api.nvim_echo({{ table.concat(output, '\n') }}, true, {})
  end
  local on_error = function(err)
    print('Error!')
    vim.api.nvim_echo({{ table.concat(err, '\n'), 'ErrorMsg' }}, true, {})
  end
  return exporter(command , target, on_success, on_error)

end

M.setup = function()
  require("orgmode").setup({
    org_agenda_files = {'~/my-orgs/*'},
    org_custom_exports = {
      m = {
        label = "Export to markdown",
        action = function(exporter)
          return exportTo(exporter, 'markdown')
        end
      },
      h = {
        label = "Export to Html",
        action = function(exporter)
          return exportTo(exporter, 'html')
        end
      },
      p = {
        label = "Export to PDF",
        action = function(exporter)
          return exportTo(exporter, 'pdf')
        end
      }
    }
  })
end


M.mappings = {
  name = "orgmode",
  i = {
    s = {'<Cmd>lua require("orgmode").action("org_mappings.org_schedule")<CR>', 'schedule'},
    t = {'<Cmd>lua require("orgmode").action("org_mappings.insert_todo_heading_respect_content")<CR>', 'todo-head'},
    ['!'] = {'<Cmd>lua require("orgmode").action("org_mappings.org_time_stamp", "true")<CR>', 'timestamp'},
    T = {'<Cmd>lua require("orgmode").action("org_mappings.insert_todo_heading")<CR>', 'Todo'},
    d = {'<Cmd>lua require("orgmode").action("org_mappings.org_deadline")<CR>', 'deadline'},
    h = {'<Cmd>lua require("orgmode").action("org_mappings.insert_heading_respect_content")<CR>', 'heading'},
    ['.'] = {'<Cmd>lua require("orgmode").action("org_mappings.org_time_stamp")<CR>', 'timestamp'},
  },
  a = {'<Cmd>lua require("orgmode").action("agenda.prompt")<CR>', 'agenda'},
  t = {'<Cmd>lua require("orgmode").action("org_mappings.set_tags")<CR>', 'tag'},
  J = {'<Cmd>lua require("orgmode").action("org_mappings.move_subtree_down")<CR>', 'Move down'},
  ['$'] = {'<Cmd>lua require("orgmode").action("org_mappings.archive")<CR>', 'archive'},
  e = {'<Cmd>lua require("orgmode").action("org_mappings.export")<CR>', 'export'},
  r = {'<Cmd>lua require("orgmode").action("capture.refile_headline_to_destination")<CR>', 'refile_heading'},
  A = {'<Cmd>lua require("orgmode").action("org_mappings.toggle_archive_tag")<CR>', 'Toggle archive tag'},
  K = {'<Cmd>lua require("orgmode").action("org_mappings.move_subtree_up")<CR>', 'Move up'},
  o = {'<Cmd>lua require("orgmode").action("org_mappings.open_at_point")<CR>', 'open_at_point'},

  c = {
    name = "change",
    d = {'<Cmd>lua require("orgmode").action("org_mappings.change_date")<CR>', 'date'},
    t = {'<Cmd>lua require("orgmode").action("org_mappings.todo_next_state")<CR>', 'todo_next'},
    T = {'<Cmd>lua require("orgmode").action("org_mappings.todo_prev_state")<CR>', 'todo_prev'},
    c = {'<Cmd>lua require("orgmode").action("org_mappings.toggle_checkbox")<CR>', 'checkbox'}
  }
}

return M
