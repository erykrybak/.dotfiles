return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()

      local registry = require("mason-registry")

      local function ensure_installed(packages)
        for _, package in ipairs(packages) do
          if not registry.is_installed(package) then
            vim.cmd("MasonInstall " .. package)
          end
        end
      end

      ensure_installed({
        "prettier",
        "stylua",
        "isort",
        "black",
        "clang-format",
        "shfmt",
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "pyright",
          "cssls",
          "jsonls",
          "tsserver",
          "clangd",
          "docker_compose_language_service",
          "dockerls",
          "volar",
        },
      })
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
    end,
  },
}
