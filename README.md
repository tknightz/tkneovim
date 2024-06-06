# TKNeovim
The editor I use for work, and it works.
![Neovim Screenshot](https://github.com/tknightz/tkneovim/assets/40225276/ad8ae755-62cf-406a-b619-aabe11b7dcf6)

This is my personal Neovim configuration, tailored to enhance my coding
experience and increase productivity. It is designed to work seamlessly with
Neovim, a highly extensible and powerful text editor built for developers.
## 🔧 Features
- **Plugins**: The configuration includes a curated list of plugins that extend
Neovim's functionality. These plugins cover various aspects such as code
navigation, syntax highlighting, version control integration, and more.

- **Custom Keybindings**: I have defined intuitive keybindings to streamline
common tasks and provide quick access to frequently used features.

- **Color Scheme**: The configuration includes a carefully selected color
scheme that offers a visually pleasing and comfortable coding environment.

- **Code Formatting**: Integrated tools and settings ensure consistent code
formatting and style across different programming languages.

- **Language-specific Configurations**: The configuration includes
language-specific settings and plugins for popular programming languages,
making it suitable for a wide range of development tasks.

- **Extensibility**: The configuration is modular and easy to extend. You can
customize it further according to your preferences and needs.
## 📋 Prerequisites
To use this Neovim configuration, you need to have Neovim installed on your
system. You can find installation instructions for your operating system on the
[official Neovim website](https://neovim.io/).

And these tools:
- git
- [ripgrep](https://github.com/BurntSushi/ripgrep) -- searching tool
- [delta](https://github.com/dandavison/delta) -- better for viewing git diff
- [bat](https://github.com/sharkdp/bat) - view text files with syntax highlight
## 📦 Installation
1. Backup your existing Neovim configuration files if necessary. The location
   of configuration directory depends on your operating system:
    - Linux: `~/.config/nvim/`
    - macOS: `~/.config/nvim/`
    - Windows (PowerShell): `$HOME/AppData/Local/nvim/`
```sh
# Unix-like
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone or download this repository to your local machine.
```sh
git clone https://github.com/tknightz/tkneovim ~/.config/nvim
```

3. Launch Neovim. It will automatically install any missing plugins and perform
additional setup steps.
## 🚀 Usage
Once installed, you can start using Neovim with this configuration immediately.
Familiarize yourself with the keybindings and features provided by the
configuration to make the most out of your coding sessions.

🤔 **How to add new plugin?**
1. Add you plugin spec to one of these files inside `📁 lua/modules/source/` or
   you can create new file `.lua` inside it.

2. Here is an example of plugin spec:
```lua
return {
  { -- name of plugin
    "hrsh7th/nvim-cmp", -- path to clone it (creator/name-of-repo)
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "autopairs",
    },
    event = { "InsertEnter", "CmdlineEnter" },
  },

  -- other plugin specs
}
```

3. Restart Neovim and let `Lazy` do its job
## 🤝 Contributing
If you have suggestions, improvements, or bug fixes, feel free to contribute to
this project. Create a pull request with your changes, and I'll review them as
soon as possible.
## 📄 License
This Neovim configuration is open source and released under the [MIT
License](LICENSE). Feel free to use, modify, and distribute it according to the
terms of the license.
## 🙏 Acknowledgments
I would like to express my gratitude to the Neovim community and the creators
of the plugins used in this configuration. Their hard work and dedication have
greatly contributed to making Neovim a fantastic tool for developers.
