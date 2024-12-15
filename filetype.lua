vim.filetype.add({
  extension = { http = "http", hurl = "hurl", mdx = "mdx" },
  -- filename = {
  --   ["Dockerfile-dev"] = 'dockerfile',
  -- },
  pattern = {
    [".*/Dockerfile.*"] = "dockerfile",
    [".*/.env.*"] = "sh",
  },
})
