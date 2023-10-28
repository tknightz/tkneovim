local normal = {
  w     = {'<C-W>w',                     'other-window'          },
  d     = {'<C-W>c',                     'delete-window'         },
  ["-"] = {'<C-W>s',                     'split-window-below'    },
  ["/"] = {'<C-W>v',                     'split-window-right'    },
  [2]   = {'<C-W>v',                     'layout-double-columns' },
  h     = {'<C-W>h',                     'window-left'           },
  i     = {'<cmd>Telescope windows<cr>', 'iWindows'              },
  j     = {'<C-W>j',                     'window-below'          },
  l     = {'<C-W>l',                     'window-right'          },
  k     = {'<C-W>k',                     'window-up'             },
  H     = {'<C-W>5<',                    'expand-window-left'    },
  J     = {'<cmd>resize +5<cr>',         'expand-window-below'   },
  L     = {'<C-W>5>',                    'expand-window-right'   },
  K     = {'<cmd>resize -5<cr>',         'expand-window-up'      },
  ["="] = {'<C-W>=',                     'balance-window'        },
  s     = {'<cmd>WinShift<cr>',          'shift window'          },
  v     = {'<C-W>v',                     'split-window-below'    },
  m     = {'<cmd>MaximizerToggle<cr>',   'toggle maximize window'},

  t = {
    name    = 'transform',
    j       = {'<cmd>wincmd J<cr>'       , 'swap-window-vertical' },
    h       = {'<cmd>wincmd H<cr>'       , 'swap-window-horizontal' },
  },

}

return {
  name = '+windows' ,
  normal = normal,
  visual = normal,
}
