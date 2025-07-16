return {
  filetypes = {
    "latex",
    "org",
    "markdown",
  },
  settings = {
    ltex = {
      enabled = { "latex", "markdown", "org" },
      setenceCacheSize = 5000,
      additionalRules = { enablePickyRules = true },
      -- flags = { debounce_text_changes = 1000 },
      checkFrequency = "save",
      completionEnabled = true,
    },
  },
}
