require("filetype").setup({
  overrides = {
    literal = {
      -- Set the filetype of files named "MyBackupFile" to lua
      OUTLINE = "Outline",
    },

    complex = {
      ["Dockerfile*"] = "dockerfile",
    },
  },
})
