return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp", -- Auto-completion framework
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Basic Mason setup
    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        "intelephense",
        "tailwindcss",
        "tsserver",
        "eslint",
        "html",
        "cssls",
        "gopls",
        "phpactor", -- Laravel Language Server alternative
      },
      automatic_installation = true,
    })

    -- Configure each server

    for server, config in pairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
        settings = config.settings or {},
      })
    end
  end,
}
