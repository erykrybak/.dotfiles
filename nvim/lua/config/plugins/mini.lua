return {
  {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
      require("mini.statusline").setup({ use_icons = true })

      require("mini.starter").setup()

      require("mini.surround").setup()

      require("mini.comment").setup()
      vim.keymap.set("n", "<leader>gc", "gcc", { remap = true, desc = "Toggle Comment Line" })
      vim.keymap.set("x", "<leader>gc", "gc", { remap = true, desc = "Toggle Comment Selection" })

      require("mini.hipatterns").setup({
        highlighters = {
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      })

      require("mini.move").setup({
        mappings = {
          left = "<M-Left>",
          right = "<M-Right>",
          down = "<M-Down>",
          up = "<M-Up>",

          line_left = "<M-Left>",
          line_right = "<M-Right>",
          line_down = "<M-Down>",
          line_up = "<M-Up>",
        },
      })
    end,
  },
}
