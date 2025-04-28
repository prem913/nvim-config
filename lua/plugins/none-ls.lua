return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function(client, bufnr)
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- require("none-ls.diagnostics.eslint_d"),
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.formatting.prettier,
        -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.diagnostics.codespell,
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.formatting.stylua,
      },
    })
  end,
}
