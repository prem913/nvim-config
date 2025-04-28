return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "jdtls", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      -- lspconfig.gopls.setup({})
      -- lspconfig.jdtls.setup({})
      -- lspconfig.pyright.setup({})
      -- lspconfig.html.setup({})
      local servers = { "tsserver", "tailwindcss", "eslint", "cssls", "gopls", "jdtls", "pyright" }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities
        }
      end

      --Enable (broadcasting) snippet capability for completion
      local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
      htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true

      lspconfig.html.setup {
        capabilities = capabilities,
      }
      -- require("typescript-tools").setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<C-Space>", vim.lsp.buf.signature_help, { desc = "Signature hint" })
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename all occurances in the project" })
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}
