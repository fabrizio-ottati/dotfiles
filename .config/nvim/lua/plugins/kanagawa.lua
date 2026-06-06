return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        background = { dark = "wave", light = "lotus" },
      })

      local colormode_file = vim.fn.expand("~/.config/colormode")
      local ok, lines = pcall(vim.fn.readfile, colormode_file)
      vim.o.background = (ok and lines[1] == "dark") and "dark" or "light"
      vim.cmd("colorscheme kanagawa")

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
