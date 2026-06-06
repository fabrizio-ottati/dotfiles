return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- Wrap neo-tree's highlights.setup so our override runs immediately
    -- after it every time (ColorScheme changes, initial load, etc.)
    local hl = require("neo-tree.ui.highlights")
    local orig_setup = hl.setup
    hl.setup = function(...)
      orig_setup(...)
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { bold = true })
    end
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { bold = true })
  end,
  opts = {
    default_component_configs = {
      indent = {
        with_markers = false,
      },
    },
    filesystem = {
      use_libuv_file_watcher = true,
      follow_current_file = { enabled = true },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          require("neo-tree.command").execute({ action = "close" })
        end
      },
    },
    window = {
      mappings = {
        ["<space>"] = "none",
        ["h"] = "close_node",
        ["l"] = "open",
      },
    },
  }
}
