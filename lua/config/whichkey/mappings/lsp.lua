local wk = require("which-key")
local snack_search_fn = require("lib").snack_search_fn

local function toggle_inlay_hint()
  if vim.g.loaded_lsp == 0 then
    return
  end
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

local function toggle_lsp()
  if vim.g.loaded_lsp == 1 then
    vim.lsp.stop_client(vim.lsp.get_clients(), true)
    vim.g.loaded_lsp = 0
    vim.g.should_attach = 0
  else
    vim.cmd("LspStart")
    vim.g.loaded_lsp = 1
    vim.g.should_attach = 1
  end
end

local format_notification_id = "formatter_status" -- Unique ID for formatter notifications
local format_spinner_timer = nil -- Timer for animating the spinner
local format_spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" } -- Frames for the spinner animation
local format_current_spinner_idx = 1 -- Current index for spinner frames
local is_formatting_currently_active = false -- Guard to prevent concurrent formatting runs

-- Stops the spinner animation and clears the timer
local function stop_format_spinner()
  if format_spinner_timer then
    format_spinner_timer:close()
    format_spinner_timer = nil
  end
  format_current_spinner_idx = 1
end

-- Shows an animated "Formatting in progress..." notification
local function show_formatting_progress_animation()
  stop_format_spinner() -- Clear any existing spinner for formatting

  -- Initial notification with the first spinner frame
  vim.notify("Formatting in progress...", vim.log.levels.INFO, {
    id = format_notification_id,
    title = "Formatter",
    icon = format_spinner_frames[format_current_spinner_idx],
    replace = true, -- Replace any existing notification with the same ID
    timeout = false, -- Keep the notification open until explicitly changed or closed (if supported by notification plugin)
  })

  format_spinner_timer = vim.uv.new_timer()
  if not format_spinner_timer then
    vim.notify("Failed to create spinner timer for formatter.", vim.log.levels.ERROR, { title = "Formatter" })
    return
  end

  -- Start the timer to update the spinner icon
  format_spinner_timer:start(100, 80, function() -- Start after 100ms, repeat every 80ms
    if not format_spinner_timer or format_spinner_timer:is_closing() then
      stop_format_spinner()
      return
    end

    format_current_spinner_idx = (format_current_spinner_idx % #format_spinner_frames) + 1
    local icon = format_spinner_frames[format_current_spinner_idx]
    -- Update the notification with the new spinner frame
    vim.notify(icon .. " Formatting in progress...", vim.log.levels.INFO, {
      id = format_notification_id,
      title = "Formatter",
      icon = icon,
      replace = true,
      timeout = false,
    })
  end)
end

-- Callback function for conform.format
local function format_cb(err)
  stop_format_spinner() -- Stop the spinner animation

  local final_message
  local final_level
  local final_icon

  if err then -- conform provides an error string if formatting failed
    final_message = "🚨 Format failed!"
    if type(err) == "string" and err ~= "" then
      final_message = "An unspecified error occurred."
    end
    final_level = vim.log.levels.ERROR
    final_icon = " "
  else
    final_message = "✨ Format done!"
    final_level = vim.log.levels.INFO
    final_icon = " "
  end

  -- Display the final status notification
  vim.notify(final_message, final_level, {
    title = "Formatter",
    id = format_notification_id, -- Replace the progress notification
    icon = final_icon,
    replace = true,
    timeout = 5000, -- Auto-close success/error notification after 5 seconds
  })

  if final_level == vim.log.levels.ERROR then
    Snacks.debug.inspect("Formatter", { error = err })
  end
end

-- Main function to trigger formatting
local function format()
  if is_formatting_currently_active then
    vim.notify(
      "Formatter is already running.",
      vim.log.levels.WARN,
      { title = "Formatter", replace = true, id = format_notification_id }
    )
    return
  end

  is_formatting_currently_active = true
  show_formatting_progress_animation() -- Start displaying the progress animation

  require("conform").format({
    async = true,
    quiet = true, -- Suppress conform's own notifications
  }, function(conform_err)
    -- This callback is from conform.
    -- Ensure UI updates and our logic run safely in the main Neovim loop.
    vim.schedule(function()
      is_formatting_currently_active = false -- Reset the guard
      format_cb(conform_err) -- Process the formatting result
    end)
  end)
end

local function toggle_linter()
  local lint = require("lint")

  if vim.g.linter_enabled then
    lint.linters_by_ft = {}
    vim.g.linter_enabled = false
  else
    -- lint.try_lint()
    vim.g.linter_enabled = true
  end
end

wk.add({
  { "<leader>l", group = "lsp", mode = { "n", "v" } },
  { "<leader>la", "<cmd>lua require('fastaction').code_action()<CR>", desc = "actions" },
  { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "signature_help" },
  { "<leader>ld", "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>", desc = "toggle diagnostics" },
  { "<leader>li", "<cmd>lua vim.diagnostic.open_float({ scope = 'line' })<CR>", desc = "issues" },
  -- { "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "next" },
  { "<leader>ln", "<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<CR>", desc = "next" },
  { "<leader>lo", "<cmd>Outline<CR>", desc = "outline" },
  -- { "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "prev" },
  { "<leader>lp", "<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<CR>", desc = "prev" },
  { "<leader>lq", "<cmd>Trouble diagnostics<CR>", desc = "quickfix" },
  { "<leader>ll", toggle_linter, desc = "toggle_linter" },
  { "<leader>lf", format, desc = "format", mode = { "n", "v" } },
  { "<leader>lt", toggle_lsp, desc = "toggle" },
  { "<leader>lh", toggle_inlay_hint, desc = "toggle hint" },
  { "<leader>l/", snack_search_fn("lsp_references"), desc = "references" },

  { "<leader>lv", group = "view" },
  { "<leader>lvd", snack_search_fn("lsp_definitions"), desc = "definition" },
  { "<leader>lvi", snack_search_fn("lsp_implementations"), desc = "implementation" },
  { "<leader>lvr", snack_search_fn("lsp_references"), desc = "references" },
  { "<leader>lvt", snack_search_fn("lsp_type_definitions"), desc = "types" },
})
