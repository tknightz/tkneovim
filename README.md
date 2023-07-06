# TKneovim
The editor I use for work, and it works.

![StartupTime](./images/startuptime.gif)

## Prerequisite
- git
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [delta](https://github.com/dandavison/delta)
- [bat](https://github.com/sharkdp/bat)


## For the first time

```
:packadd packer.nvim
:lua require("modules.installer")
:PackerInstall
:PackerCompile
```
