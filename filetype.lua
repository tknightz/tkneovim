vim.filetype.add({
  extension = { http = "http", hurl = "hurl", mdx = "mdx", godot = "gdresource", gd = "gdscript", todo = "todo" },
  pattern = {
    [".*/Dockerfile.*"] = "dockerfile",
    [".*/.env.*"] = "sh",
  },
})
