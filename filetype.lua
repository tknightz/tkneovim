vim.filetype.add({
  extension = {
    http = "http",
    hurl = "hurl",
    mdx = "mdx",
    godot = "gdresource",
    gd = "gdscript",
    todo = "todo",
    mdc = "markdown",
    tfvars = "terraform",
    env = "sh",
  },
  pattern = {
    [".*/Dockerfile.*"] = "dockerfile",
    [".*/.env.*"] = "sh",
    ["config"] = "config",
  },
})
