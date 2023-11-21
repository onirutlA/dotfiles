local ensure_installed = {
  -- LSP
  "clangd",
  "css-lsp",
  "cssmodules-language-server",
  "docker-compose-language-service",
  "dockerfile-language-server",
  "emmet-ls",
  "eslint-lsp",
  "golangci-lint-langserver",
  "gopls",
  "html-lsp",
  "jdtls",
  "json-lsp",
  "ltex-ls",
  "lua-language-server",
  "marksman",
  "nginx-language-server",
  "prisma-language-server",
  "ruff",
  "ruff-lsp",
  "rust-analyzer",
  "sqlls",
  "svelte-language-server",
  "tailwindcss-language-server",
  "terraform-ls",
  "texlab",
  "tflint",
  "typescript-language-server",
  "vetur-vls",
  "vim-language-server",
  "vue-language-server",
  "yaml-language-server",

  -- Linter
  "actionlint",
  "commitlint",
  "cpplint",
  "eslint_d",
  "gitlint",
  "golangci-lint",
  "google-java-format",
  "hadolint",
  "jsonlint",
  "ktlint",
  "luacheck",
  "revive",
  "shellcheck",
  "shellharden",
  "sqlfluff",
  "staticcheck",
  "stylelint",
  "textlint",
  "tflint",
  "tfsec",
  "ts-standard",
  "vint",
  "yamllint",

  -- Formater
  "clang-format",
  "gofumpt",
  "goimports",
  "goimports-reviser",
  "golines",
  "gomodifytags",
  "gotests",
  "ktlint",
  "latexindent",
  "prettier",
  "prettierd",
  "shellharden",
  "sqlfmt",
  "stylua",
  "ts-standard",
  "xmlformatter",
  "yamlfmt",

  -- DAP
  "bash-debug-adapter",
  "codelldb",
  "cpptools",
  "dart-debug-adapter",
  "debugpy",
  "delve",
  "firefox-debug-adapter",
  "go-debug-adapter",
  "java-debug-adapter",
  "java-test",
  "js-debug-adapter",
  "kotlin-debug-adapter",
  "node-debug2-adapter",
}

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = ensure_installed,
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
      },
    },
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },
}