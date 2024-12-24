vim.filetype.add({
  extension = { http = "http", hurl = "hurl", mdx = "mdx", godot = "gdresource", gd = "gdscript" },
  pattern = {
    [".*/Dockerfile.*"] = "dockerfile",
    [".*/.env.*"] = "sh",
  },
})
