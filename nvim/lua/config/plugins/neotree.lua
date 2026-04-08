return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require('neo-tree').setup({
        window = {
          position = "left"
        },
	filesystem = {
          hijack_netrw_behavior = "open_current", 
          
          follow_current_file = {
            enabled = true, 
          },
        },
      })
      vim.keymap.set("n", "<leader>t", ":Neotree toggle position=left<CR>", { desc = "Toggle Neo-tree" })
    end
  }
}
