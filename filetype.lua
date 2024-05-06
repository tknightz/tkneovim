vim.filetype.add({
  extension = { http = 'http', hurl = 'hurl' },
  -- filename = {
  --   ["Dockerfile-dev"] = 'dockerfile',
  -- },
  pattern = { 
    [".*/Dockerfile.*"] = 'dockerfile',
    [".*/.env.*"] = 'sh'
  }
}) 
