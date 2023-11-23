require("fidget").setup({
  progress = {
    display = {
      progress_icon = {
        pattern = "arc",
      },
      done_icon = " ",
    },
  },
})

vim.cmd("hi FidgetTitle guifg=#bf68b9 gui=bold,nocombine")
