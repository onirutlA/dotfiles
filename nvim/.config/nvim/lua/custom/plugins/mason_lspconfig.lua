return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "clangd",
        "cssls",
        "cssmodules_ls",
        "denols",
        "docker_compose_language_service",
        "dockerls",
        "emmet_ls",
        "eslint",
        "golangci_lint_ls",
        "gopls",
        "gradle_ls",
        "helm_ls",
        "html",
        "jdtls",
        "json_ls",
        "ltex",
        "luals",
        "marksman",
        "prismals",
        "pyright",
        "rubocop",
        "spectral",
        "sqlls",
        "svelte",
        "tailwindcss",
        "terraformls",
        "tflint",
        "tsserver",
        "vimls",
        "yamlls",
      },
    },
    cmd = { "LspInstall", "LspUninstall" },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
}
