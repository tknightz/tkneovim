-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/tknightz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tknightz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tknightz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tknightz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tknightz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  autopairs = {
    config = { "require('modules/config/autopairs')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  bqf = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  bracey = {
    commands = { "Bracey" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/bracey",
    url = "https://github.com/turbio/bracey.vim"
  },
  bufdelete = {
    commands = { "Bdelete", "Bwipeout" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/bufdelete",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  bufferline = {
    config = { "require('modules/config/bufferline')" },
    load_after = {
      theme = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/bufferline",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  cleverf = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cleverf",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  cmp = {
    after = { "cmp-emoji", "cmp_luasnip", "cmp-nvim-lsp", "cmp-buffer", "cmp-path" },
    config = { "require('modules/config/cmp')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      cmp = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-emoji"] = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {
      cmp = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      cmp = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      cmp = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      cmp = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  colorizer = {
    config = { "require('modules/config/colorizer')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/colorizer",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  comment = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/comment/after/plugin/Comment.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/comment",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  dadbodui = {
    commands = { "DBUI", "DBUIAddConnection", "DBUIToggle" },
    config = { "require('modules/config/dadbodui')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/dadbodui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  dashboard = {
    loaded = true,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/dashboard",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  devicons = {
    config = { "require('modules/config/devicons')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  diffview = {
    commands = { "DiffviewOpen", "DiffviewToggleFiles" },
    config = { "require('modules/config/diffview')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/diffview",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  editorconfig = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/editorconfig",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  emmet = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/emmet",
    url = "https://github.com/mattn/emmet-vim"
  },
  ezalign = {
    commands = { "EasyAlign" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/ezalign",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ezterm = {
    commands = { "Ezterm", "EztermFind" },
    config = { "require('modules/config/ezterm')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/ezterm",
    url = "https://github.com/tknightz/ezterm.nvim"
  },
  filetype = {
    config = { "require('modules/config/filetype')" },
    loaded = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/start/filetype",
    url = "https://github.com/nathom/filetype.nvim"
  },
  friendlysnippet = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/friendlysnippet",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fugitive = {
    commands = { "Git" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  gitconflict = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/gitconflict",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  gitsigns = {
    config = { "require('modules/config/gitsigns')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/gitsigns",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  go = {
    config = { "require('modules/config/go')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/go",
    url = "https://github.com/ray-x/go.nvim"
  },
  grammarguard = {
    config = { "require('modules/config/grammarguard')" },
    load_after = {
      lspconfig = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/grammarguard",
    url = "https://github.com/brymer-meneses/grammar-guard.nvim"
  },
  illuminate = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  incsearch = {
    keys = { { "", "/" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/incsearch",
    url = "https://github.com/haya14busa/is.vim"
  },
  indentguide = {
    config = { "require('modules/config/indentguide')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/indentguide",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  jsxpretty = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/jsxpretty",
    url = "https://github.com/maxmellon/vim-jsx-pretty"
  },
  lastplace = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/start/lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  lightspeed = {
    config = { "require('modules/config/lightspeed')" },
    keys = { { "", "gz" }, { "", "gZ" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/lightspeed",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  lspconfig = {
    after = { "nullls", "lspinstaller", "lspsaga", "grammarguard" },
    commands = { "LspStart" },
    config = { "require('modules/config/lspconfig')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  lspinstaller = {
    config = { "require('modules/config/lspinstaller')" },
    load_after = {
      lspconfig = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/lspinstaller",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  lspsaga = {
    config = { "require('modules/config/lspsaga')" },
    load_after = {
      lspconfig = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/lspsaga",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  lualine = {
    config = { "require('modules/config/lualine')" },
    load_after = {
      theme = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/lualine",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  luasnip = {
    config = { "require('modules/config/luasnip')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/luasnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  matchup = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  maximizer = {
    commands = { "MaximizerToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  mdpreview = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/mdpreview",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  modes = {
    config = { "require('modules/config/modes')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/modes",
    url = "https://github.com/mvllow/modes.nvim"
  },
  mundo = {
    commands = { "MundoShow", "MundoToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  neoscroll = {
    config = { "require('modules/config/neoscroll')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/neoscroll",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  notify = {
    config = { "require('modules/config/notify')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  nullls = {
    config = { "require('modules/config/nullls')" },
    load_after = {
      lspconfig = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nullls",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  nvimtree = {
    commands = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile" },
    config = { "require('modules/config/nvimtree')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvimtree",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  orgbullets = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/orgbullets",
    url = "https://github.com/akinsho/org-bullets.nvim"
  },
  orgmode = {
    config = { "require('modules/config/orgmode')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    commands = { "PackerCompile", "PackerStatus", "PackerInstall", "PackerUpdate", "PackerLoad", "PackerClean" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22modules.installer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  pqf = {
    config = { "\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\0\1\0\4\tinfo\t \nerror\t \thint\t \fwarning\t \nsetup\bpqf\frequire\0" },
    loaded = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/start/pqf",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  prettier = {
    commands = { "Prettier", "PrettierAsync", "PrettierFragment" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  prettyfold = {
    config = { "require('modules/config/prettyfold')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/prettyfold",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  preview = {
    commands = { "PreviewDef", "PreviewImpl", "PreviewClose" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  pyindent = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/pyindent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  sandwich = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  signature = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/signature",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  sniprun = {
    commands = { "SnipRun", "SnipInfo" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  sphinx = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/sphinx",
    url = "https://github.com/stsewd/sphinx.nvim"
  },
  startuptime = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/startuptime",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  symbolsoutline = {
    commands = { "SymbolsOutline" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/symbolsoutline",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  tagalong = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/tagalong",
    url = "https://github.com/AndrewRadev/tagalong.vim"
  },
  telescope = {
    after = { "telescope-project.nvim", "toggletermfinder" },
    commands = { "Telescope" },
    config = { "require('modules/config/telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/telescope",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-live-grep-raw.nvim"] = {
    loaded = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/start/telescope-live-grep-raw.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-raw.nvim"
  },
  ["telescope-project.nvim"] = {
    load_after = {
      telescope = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  theme = {
    after = { "treesitter", "bufferline", "lualine" },
    config = { "require('modules.utils.colorscheme').config_colorscheme('onedark')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/theme",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  todocomment = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/todocomment",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  toggleterm = {
    commands = { "ToggleTerm" },
    config = { "require('modules/config/toggleterm')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/toggleterm",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  toggletermfinder = {
    load_after = {
      telescope = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/toggletermfinder",
    url = "https://github.com/tknightz/telescope-termfinder.nvim"
  },
  treesitter = {
    after = { "treesitter-rainbow", "treesitter-textobjects" },
    config = { "require('modules/config/treesitter')" },
    load_after = {
      theme = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["treesitter-playground"] = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/treesitter-playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["treesitter-rainbow"] = {
    load_after = {
      treesitter = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/treesitter-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["treesitter-textobjects"] = {
    load_after = {
      treesitter = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  trouble = {
    commands = { "Trouble" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/trouble",
    url = "https://github.com/folke/trouble.nvim"
  },
  truezen = {
    commands = { "TZMinimalist", "TZFocus", "TZAtaraxis" },
    config = { "require('modules/config/truezen')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/truezen",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["vim-dadbod"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  whichkey = {
    config = { "require('modules/config/whichkey')" },
    keys = { { "", "<leader>" }, { "", "<Space>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/whichkey",
    url = "https://github.com/folke/which-key.nvim"
  },
  winjumping = {
    commands = { "WindowJumping" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/winjumping",
    url = "https://github.com/tknightz/window-jumping.lua"
  },
  winshift = {
    commands = { "WinShift" },
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rwinshift\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/winshift",
    url = "https://github.com/sindrets/winshift.nvim"
  },
  workplace = {
    commands = { "WS" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/workplace",
    url = "https://github.com/dosimple/workspace.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp"] = "cmp",
  ["^ezterm"] = "ezterm",
  ["^friendlysnippet"] = "friendlysnippet",
  ["^lsp_signature"] = "signature",
  ["^luasnip"] = "luasnip",
  ["^notify"] = "notify",
  ["^nvim%-web%-devicons"] = "devicons",
  ["^plenary"] = "plenary.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: mdpreview
time([[Setup for mdpreview]], true)
require('modules/setup/mdpreview')
time([[Setup for mdpreview]], false)
-- Setup for: symbolsoutline
time([[Setup for symbolsoutline]], true)
require('modules/setup/symbolsoutline')
time([[Setup for symbolsoutline]], false)
-- Setup for: dashboard
time([[Setup for dashboard]], true)
require('modules/setup/dashboard')
time([[Setup for dashboard]], false)
time([[packadd for dashboard]], true)
vim.cmd [[packadd dashboard]]
time([[packadd for dashboard]], false)
-- Setup for: matchup
time([[Setup for matchup]], true)
require('modules/setup/matchup')
time([[Setup for matchup]], false)
-- Config for: filetype
time([[Config for filetype]], true)
require('modules/config/filetype')
time([[Config for filetype]], false)
-- Config for: pqf
time([[Config for pqf]], true)
try_loadstring("\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\0\1\0\4\tinfo\t \nerror\t \thint\t \fwarning\t \nsetup\bpqf\frequire\0", "config", "pqf")
time([[Config for pqf]], false)
-- Config for: lastplace
time([[Config for lastplace]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "lastplace")
time([[Config for lastplace]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoShow lua require("packer.load")({'mundo'}, { cmd = "MundoShow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoToggle lua require("packer.load")({'mundo'}, { cmd = "MundoToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipInfo lua require("packer.load")({'sniprun'}, { cmd = "SnipInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ToggleTerm lua require("packer.load")({'toggleterm'}, { cmd = "ToggleTerm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZFocus lua require("packer.load")({'truezen'}, { cmd = "TZFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MaximizerToggle lua require("packer.load")({'maximizer'}, { cmd = "MaximizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbolsoutline'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bracey lua require("packer.load")({'bracey'}, { cmd = "Bracey", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'treesitter-playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewToggleFiles lua require("packer.load")({'diffview'}, { cmd = "DiffviewToggleFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bdelete lua require("packer.load")({'bufdelete'}, { cmd = "Bdelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bwipeout lua require("packer.load")({'bufdelete'}, { cmd = "Bwipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIToggle lua require("packer.load")({'dadbodui'}, { cmd = "DBUIToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIAddConnection lua require("packer.load")({'dadbodui'}, { cmd = "DBUIAddConnection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspStart lua require("packer.load")({'lspconfig'}, { cmd = "LspStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PreviewDef lua require("packer.load")({'preview'}, { cmd = "PreviewDef", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PreviewImpl lua require("packer.load")({'preview'}, { cmd = "PreviewImpl", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PreviewClose lua require("packer.load")({'preview'}, { cmd = "PreviewClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerCompile lua require("packer.load")({'packer.nvim'}, { cmd = "PackerCompile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerStatus lua require("packer.load")({'packer.nvim'}, { cmd = "PackerStatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'truezen'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerUpdate lua require("packer.load")({'packer.nvim'}, { cmd = "PackerUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerLoad lua require("packer.load")({'packer.nvim'}, { cmd = "PackerLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ezterm lua require("packer.load")({'ezterm'}, { cmd = "Ezterm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EztermFind lua require("packer.load")({'ezterm'}, { cmd = "EztermFind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUI lua require("packer.load")({'dadbodui'}, { cmd = "DBUI", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WS lua require("packer.load")({'workplace'}, { cmd = "WS", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Prettier lua require("packer.load")({'prettier'}, { cmd = "Prettier", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvimtree'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerClean lua require("packer.load")({'packer.nvim'}, { cmd = "PackerClean", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerInstall lua require("packer.load")({'packer.nvim'}, { cmd = "PackerInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvimtree'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvimtree'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WindowJumping lua require("packer.load")({'winjumping'}, { cmd = "WindowJumping", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PrettierAsync lua require("packer.load")({'prettier'}, { cmd = "PrettierAsync", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PrettierFragment lua require("packer.load")({'prettier'}, { cmd = "PrettierFragment", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WinShift lua require("packer.load")({'winshift'}, { cmd = "WinShift", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EasyAlign lua require("packer.load")({'ezalign'}, { cmd = "EasyAlign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZMinimalist lua require("packer.load")({'truezen'}, { cmd = "TZMinimalist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'whichkey'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gz <cmd>lua require("packer.load")({'lightspeed'}, { keys = "gz", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gZ <cmd>lua require("packer.load")({'lightspeed'}, { keys = "gZ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> / <cmd>lua require("packer.load")({'incsearch'}, { keys = "/", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Space> <cmd>lua require("packer.load")({'whichkey'}, { keys = "<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'tagalong', 'emmet'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'tagalong'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'tagalong', 'emmet', 'jsxpretty'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'sphinx', 'pyindent'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'tagalong', 'emmet', 'jsxpretty'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'tagalong', 'jsxpretty'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType org ++once lua require("packer.load")({'orgbullets', 'orgmode'}, { ft = "org" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'jsxpretty'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType qf ++once lua require("packer.load")({'bqf'}, { ft = "qf" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'mdpreview'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'indentguide'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'autopairs', 'cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'editorconfig', 'theme'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'colorizer', 'comment', 'gitconflict', 'gitsigns', 'modes', 'todocomment', 'illuminate', 'neoscroll', 'sandwich', 'cleverf', 'matchup', 'prettyfold'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/tknightz/.local/share/nvim/site/pack/packer/opt/go/ftdetect/go.vim]], true)
vim.cmd [[source /home/tknightz/.local/share/nvim/site/pack/packer/opt/go/ftdetect/go.vim]]
time([[Sourcing ftdetect script at: /home/tknightz/.local/share/nvim/site/pack/packer/opt/go/ftdetect/go.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
