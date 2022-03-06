return {
  filetypes = {"html"},
  cmd = {"html-languageserver", "--stdio"},
  init_options = {
    configurationSection = {"html", "css", "javascript"},
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  },
}
