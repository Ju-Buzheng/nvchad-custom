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

return M
