return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.2.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<space>fg", require('telescope.builtin').live_grep, { desc = "Grep (Search file contents))" })
    end
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
	require("telescope").setup ({
	extensions = {
	  ["ui-select"] = {
	    require("telescope.themes").get_dropdown {
	    }
	  }
	}
      })
      require("telescope").load_extension("ui-select")
      end
    }
  }
