return {
  -- Like its name, open markdown preview on browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    build = "cd app && npm install && git reset --hard",
  },
  -- {
  --   "nvim-neorg/neorg",
  --   -- build = ":Neorg sync-parsers",
  --   -- commit = "0360855d8fa7a643d1f41ee83528c337fd47f674",
  --   ft = "norg",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("neorg").setup({
  --       load = {
  --         ["core.defaults"] = {}, -- Loads default behavior
  --         ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --         ["core.keybinds"] = {
  --           config = {
  --             hook = function(keybinds)
  --               keybinds.unmap("norg", "n", keybinds.leader .. "nn")
  --             end,
  --           },
  --         },
  --         ["core.dirman"] = { -- Manages Neorg workspaces
  --           config = {
  --             workspaces = {
  --               notes = "~/notes",
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
}
