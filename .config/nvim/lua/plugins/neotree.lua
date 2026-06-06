return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    local function set_dir_hl()
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { bold = true })
    end
    set_dir_hl()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function() vim.schedule(set_dir_hl) end,
    })
  end,
  opts = {
    default_component_configs = {
      icon = {
        enabled = false,
      },
      indent = {
        with_markers = false,
      },
      git_status = {
        symbols = {
          added     = "A",
          modified  = "M",
          deleted   = "D",
          renamed   = "R",
          untracked = "?",
          ignored   = "-",
          unstaged  = "!",
          staged    = "S",
          conflict  = "C",
        },
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
