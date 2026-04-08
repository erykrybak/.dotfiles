return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,

        direction = "horizontal",

        shade_terminals = true,
      })

      vim.keymap.set({ "n", "t" }, "<leader>e", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
    end,
  },
}
