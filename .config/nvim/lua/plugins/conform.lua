return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        python = { "ruff" },
        rust = { "rustfmt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
    vim.api.nvim_create_user_command("FormatBuffer", function()
      require("conform").format({ bufnr = 0, lsp_format = "fallback", timeout_ms = 500 })
    end, { desc = "Format current buffer" })
  end,
}
