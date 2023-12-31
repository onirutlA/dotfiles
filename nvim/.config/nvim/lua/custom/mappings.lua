---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- resize buffer
    ["<C-Up>"] = { "<C-w>+", "Increase buffer height", opts = { nowait = true, noremap = true } },
    ["<C-Down>"] = { "<C-w>-", "Decrease buffer height", opts = { nowait = true, noremap = true } },
    ["<C-Left>"] = { "<C-w><", "Decrease buffer width", opts = { nowait = true, noremap = true } },
    ["<C-Right>"] = { "<C-w>>", "Increase buffer width", opts = { nowait = true, noremap = true } },

    -- Split window
    ["<leader>vs"] = {
      "<Cmd>vsplit<CR><C-l>",
      "[V]ertical [S]plit Window",
      opts = { nowait = true, noremap = true },
    },
    ["<leader>hs"] = {
      "<Cmd>split<CR><C-j>",
      "[H]orizontal [S]plit Window",
      opts = { nowait = true, noremap = true },
    },

    -- Scroll half and focus center
    ["<C-d>"] = { "<C-d>zz", "Scroll down and focus center", opts = { nowait = true, noremap = true } },
    ["<C-u>"] = { "<C-u>zz", "Scroll up and focus center", opts = { nowait = true, noremap = true } },
  },
}

M.disabled = {
  n = {
    ["<leader>v"] = "",
    ["<leader>h"] = "",
    ["<A-i>"] = "",
  },
}

M.tabufline = {
  n = {
    ["<leader>xa"] = {
      function()
        require("nvchad.tabufline").closeOtherBufs()
      end,
      "Close buffers except current buffer",
      opts = { nowait = true, noremap = true },
    },
    ["[b"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"

        local n = function()
          require("nvchad.tabufline").tabuflineNext()
        end

        local p = function()
          return require("nvchad.tabufline").tabuflinePrev()
        end

        local _, prev = ts_move.make_repeatable_move_pair(n, p)

        return prev()
      end,
      "Goto prev buffer",
      opts = { nowait = true, noremap = true },
    },
    ["]b"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"

        local n = function()
          require("nvchad.tabufline").tabuflineNext()
        end

        local p = function()
          return require("nvchad.tabufline").tabuflinePrev()
        end

        local next, _ = ts_move.make_repeatable_move_pair(n, p)

        return next()
      end,
      "Goto next buffer",
      opts = { nowait = true, noremap = true },
    },
  },
}

M.harpoon = {
  n = {
    ["<leader>ha"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():append()
      end,
      "Harpoon Add",
    },
    ["<leader>hm"] = {
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "Harpoon Menu",
    },
    ["<leader>h1"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(1)
      end,
      "Harpoon Menu",
    },
    ["<leader>h2"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(2)
      end,
      "Harpoon Menu",
    },
    ["<leader>h3"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(3)
      end,
      "Harpoon Menu",
    },
    ["<leader>h4"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(4)
      end,
      "Harpoon Menu",
    },
    ["<leader>hls"] = {
      function()
        local harpoon = require "harpoon"
        harpoon.logger:show()
      end,
      "Harpoon Menu",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fh"] = {
      "<cmd>Telescope harpoon marks<cr>",
      "Find Harpoon",
    },
  },
}

M.lspconfig = {
  n = {
    ["<leader>tf"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "[T]ype De[F]inition",
      opts = { nowait = true, noremap = true },
    },

    ["<leader>fs"] = {
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      "[F]ind [S]ymbols",
      opts = { nowait = true, noremap = true },
    },

    ["[w"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local v = vim

        local n = function()
          return v.diagnostic.goto_next {
            severity = v.diagnostic.severity.WARN,
            float = { border = "rounded" },
          }
        end

        local p = function()
          v.diagnostic.goto_prev {
            severity = v.diagnostic.severity.WARN,
            float = { border = "rounded" },
          }
        end

        local _, prev = ts_move.make_repeatable_move_pair(n, p)

        return prev()
      end,
      "[G]oto Diagnostics [P]revious",
      opts = { nowait = true, noremap = true },
    },

    ["]w"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local v = vim

        local n = function()
          return v.diagnostic.goto_next {
            severity = v.diagnostic.severity.WARN,
            float = { border = "rounded" },
          }
        end

        local p = function()
          v.diagnostic.goto_prev {
            severity = v.diagnostic.severity.WARN,
            float = { border = "rounded" },
          }
        end

        local next, _ = ts_move.make_repeatable_move_pair(n, p)

        return next()
      end,
      "[G]oto Diagnostics [N]ext",
      opts = { nowait = true, noremap = true },
    },

    ["]e"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local v = vim

        local n = function()
          return v.diagnostic.goto_next {
            severity = v.diagnostic.severity.ERROR,
            float = { border = "rounded" },
          }
        end

        local p = function()
          v.diagnostic.goto_prev {
            severity = v.diagnostic.severity.ERROR,
            float = { border = "rounded" },
          }
        end

        local next, _ = ts_move.make_repeatable_move_pair(n, p)

        return next()
      end,
      "Goto Next Error",
      opts = { nowait = true, noremap = true },
    },

    ["[e"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local v = vim

        local n = function()
          return v.diagnostic.goto_next {
            severity = v.diagnostic.severity.ERROR,
            float = { border = "rounded" },
          }
        end

        local p = function()
          v.diagnostic.goto_prev {
            severity = v.diagnostic.severity.ERROR,
            float = { border = "rounded" },
          }
        end

        local _, prev = ts_move.make_repeatable_move_pair(n, p)

        return prev()
      end,
      "Goto Previous Error",
      opts = { nowait = true, noremap = true },
    },
    ["<leader>cA"] = {
      function()
        vim.lsp.buf.code_action {
          context = {
            only = {
              "source",
            },
            diagnostics = {},
          },
        }
      end,
      "Source Action",
      opts = { nowait = true, noremap = true },
    },
  },
}

M.tmux = {
  n = {
    ["<C-h>"] = {
      "<Cmd>TmuxNavigateLeft<CR>",
      "Navigate tmux window left",
      opts = { nowait = true, noremap = true },
    },

    ["<C-j>"] = {
      "<Cmd>TmuxNavigateDown<CR>",
      "Navigate tmux window down",
      opts = { nowait = true, noremap = true },
    },

    ["<C-k>"] = {
      "<Cmd>TmuxNavigateUp<CR>",
      "Navigate tmux window up",
      opts = { nowait = true, noremap = true },
    },

    ["<C-l>"] = {
      "<Cmd>TmuxNavigateRight<CR>",
      "Navigate tmux window right",
      opts = { nowait = true, noremap = true },
    },
  },
}

M.dap = {
  n = {
    ["<leader>sd"] = {
      function()
        require("dap").continue()
      end,
      "[S]tart [D]ebugging",
      opts = { nowait = true, noremap = true },
    },

    ["<leader>so"] = {
      function()
        require("dap").step_over()
      end,
      "[S]tep [O]ver",
      opts = { nowait = true, noremap = true },
    },

    ["<leader>su"] = {
      function()
        require("dap").step_out()
      end,
      "[S]tep o[U]t",
      opts = { nowait = true, noremap = true },
    },

    ["<leader>si"] = {
      function()
        require("dap").step_into()
      end,
      "[S]tep [I]nto",
      opts = { nowait = true, noremap = true },
    },

    ["<leader>td"] = {
      function()
        require("dapui").toggle()
      end,
      "[T]oggle [D]ebug",
      opts = { nowait = true, noremap = true },
    },
    ["<leader>bp"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "[T]oggle [B]reak[P]oint",
      opts = { nowait = true, noremap = true },
    },
  },
}

M.treesitter = {
  n = {
    [";"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.repeat_last_move()
      end,
      "Treesitter Repeat Last Move Next",
    },

    [","] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.repeat_last_move_opposite()
      end,
      "Treesitter Repeat Last Move Previous",
    },

    ["f"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_f()
      end,
      "Treesitter Repeat Builtin f",
    },

    ["F"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_F()
      end,
      "Treesitter Repeat Builtin F",
    },

    ["t"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_t()
      end,
      "Treesitter Repeat Builtin t",
    },

    ["T"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_T()
      end,
      "Treesitter Repeat Builtin T",
    },
  },
  o = {
    [";"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.repeat_last_move()
      end,
      "Treesitter Repeat Last Move Next",
    },

    [","] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.repeat_last_move_opposite()
      end,
      "Treesitter Repeat Last Move Previous",
    },

    ["f"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_f()
      end,
      "Treesitter Repeat Builtin f",
    },

    ["F"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_F()
      end,
      "Treesitter Repeat Builtin F",
    },

    ["t"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_t()
      end,
      "Treesitter Repeat Builtin t",
    },

    ["T"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_T()
      end,
      "Treesitter Repeat Builtin T",
    },
  },
  x = {
    [";"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.repeat_last_move()
      end,
      "Treesitter Repeat Last Move Next",
    },

    [","] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.repeat_last_move_opposite()
      end,
      "Treesitter Repeat Last Move Previous",
    },

    ["f"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_f()
      end,
      "Treesitter Repeat Builtin f",
    },

    ["F"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_F()
      end,
      "Treesitter Repeat Builtin F",
    },

    ["t"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_t()
      end,
      "Treesitter Repeat Builtin t",
    },

    ["T"] = {
      function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        return ts_repeat_move.builtin_T()
      end,
      "Treesitter Repeat Builtin T",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>tt"] = {
      "<Cmd>TroubleToggle<CR>",
      "[T]rouble [T]oggle",
      opts = { nowait = true, noremap = true },
    },

    ["<leader>wd"] = {
      "<Cmd>TroubleToggle workspace_diagnostics<CR>",
      "TroubleToggle [W]orkspace [D]iagnostics",
      opts = { nowait = true, noremap = true },
    },
    ["<leader>qf"] = {
      "<Cmd>TroubleToggle quickfix<CR>",
      "TroubleToggle [Q]uick [F]ix",
      opts = { nowait = true, noremap = true },
    },
  },
}

M.gitsigns = {
  n = {
    ["[h"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local gs = require "gitsigns"
        local _, prev_hunk = ts_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
        return prev_hunk()
      end,
      "Repeat Prev Hunk",
    },
    ["]h"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local gs = require "gitsigns"
        local next_hunk, _ = ts_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
        return next_hunk()
      end,
      "Repeat Next Hunk",
    },
  },

  x = {
    ["]h"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local gs = require "gitsigns"
        local next_hunk, prev_hunk = ts_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
        return next_hunk(), prev_hunk()
      end,
      "Repeat Next Hunk",
    },
    ["[h"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local gs = require "gitsigns"
        local next_hunk, prev_hunk = ts_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
        return next_hunk(), prev_hunk()
      end,
      "Repeat Prev Hunk",
    },
  },

  o = {
    ["]h"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local gs = require "gitsigns"
        local next_hunk, prev_hunk = ts_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
        return next_hunk(), prev_hunk()
      end,
      "Repeat Next Hunk",
    },
    ["[h"] = {
      function()
        local ts_move = require "nvim-treesitter.textobjects.repeatable_move"
        local gs = require "gitsigns"
        local next_hunk, prev_hunk = ts_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
        return next_hunk(), prev_hunk()
      end,
      "Repeat Prev Hunk",
    },
  },
}

return M
