vim.filetype.add({
  filename = {
    ["Dockerfile.(%a+)"] = "dockerfile"
  },
  extension = {
    conf = 'conf'
  }
})
