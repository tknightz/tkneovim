require("neo-tree").setup({
  close_if_last_window = true,
  use_libuv_file_watcher = true,
  window = {
    width = 35,
    mappings = {
      ["<space>"] = "none"
    }
  },
  filesystem = {
    async_directory_scan = false
  },
})
