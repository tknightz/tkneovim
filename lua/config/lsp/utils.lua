local M = {}

function M.get_local_binary(binary)
  local cwd = vim.fn.getcwd()
  local local_bin = cwd .. "/node_modules/.bin/" .. binary
  if vim.fn.executable(local_bin) == 1 then
    return local_bin
  end
  return binary
end

function M.execute(opts)
  local params = {
    command = opts.command,
    arguments = opts.arguments,
  }
  if opts.open then
    require("trouble").open({
      mode = "lsp_command",
      params = params,
    })
  else
    return vim.lsp.buf_request(0, "workspace/executeCommand", params, opts.handler)
  end
end

M.action = setmetatable({}, {
  __index = function(_, action)
    return function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { action },
          diagnostics = {},
        },
      })
    end
  end,
})

return M
