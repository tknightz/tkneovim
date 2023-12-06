require("fidget").setup({
  progress = {
    ignore_empty_message = false,
    display = {
      progress_icon = {
        pattern = "arc",
      },
      done_icon = " ",
    },
  },
})

vim.cmd("hi FidgetTitle guifg=#bf68b9 gui=bold,nocombine")
