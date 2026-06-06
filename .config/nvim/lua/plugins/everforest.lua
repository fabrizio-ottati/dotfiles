return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "medium"
      vim.g.everforest_better_performance = 1

      local colormode_file = vim.fn.expand("~/.config/colormode")
      local ok, lines = pcall(vim.fn.readfile, colormode_file)
      vim.o.background = (ok and lines[1] == "dark") and "dark" or "light"
      vim.cmd("colorscheme everforest")

      vim.api.nvim_create_user_command("Dark", function()
        vim.o.background = "dark"
        vim.fn.writefile({ "dark" }, colormode_file)
      end, {})
      vim.api.nvim_create_user_command("Light", function()
        vim.o.background = "light"
        vim.fn.writefile({ "light" }, colormode_file)
      end, {})
    end,
  },
}
