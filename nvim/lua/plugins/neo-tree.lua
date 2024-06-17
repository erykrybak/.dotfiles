return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>t", ":Neotree filesystem reveal left toggle<CR>", {})
		require("neo-tree").setup({
			default_component_configs = {
				icon = {
					folder_closed = "[#]", -- Disable folder closed icon
					folder_open = "[*]", -- Disable folder open icon
					folder_empty = "[]", -- Disable empty folder icon
					default = "", -- Disable default file icon
				},
				name = {
					trailing_slash = false, -- Do not add a trailing slash to folder names
					use_git_status_colors = false,
				},
			},
			filesystem = {
				filtered_items = {
					visible = true, -- Show hidden files
					hide_dotfiles = false, -- Do not hide dotfiles
					hide_gitignored = false, -- Do not hide gitignored files
				},
			},
		})
	end,
}
