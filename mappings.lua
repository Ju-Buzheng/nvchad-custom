---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!
M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<leader>dus"] = {
      function ()
        local dapui = require("dapui")
        dapui.toggle()
      end,
      "Toggle dapui"
    },
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require("crates").upgrade_all_crates()
      end,
      "Update crates"
    }
  }
}

M["rust-tools"] = {
  n = {
    ["<leader>rp"] = {
      function()
        require("rust-tools").runnables.runnables()
      end,
      "RustRunables"
    }
  }
}

M["makrdown-preview"] = {
  n = {
    ["<leader>mpt"] = {
      function ()
        vim.cmd("MarkdownPreviewToggle")
      end,
      "MarkdownPreviewToggle"
    },
  }
}

M['spectre'] = {
  n = {
    ["<leader>st"] = {
      function()
        require('spectre').toggle()
      end,
      "Toggle Spectre"
    },
    ["<leader>sw"] = {
      function()
        require("spectre").open_visual({
          select_word = true
        })
      end,
      "Search current word"
    },
    ["<leader>sp"] = {
      function()
        require('spectre').open_file_search({
          select_word = true
        })
      end,
      "Search on current file"
    }
  },
  v = {
    ["<leader>sw"] = {
      function()
        local esc = vim.api.nvim_replace_termcodes('<esc>', true, false, true)
        vim.api.nvim_feedkeys(esc, 'x', false)
        require('spectre').open_visual({
          select_word = true
        })
      end,
      "Search current word"
    }
  }
}

return M
