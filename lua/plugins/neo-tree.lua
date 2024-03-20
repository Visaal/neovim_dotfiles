return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree toggle position=left<CR>", {})
		vim.keymap.set("n", "<leader>e", ":Neotree action=focus<CR>", {})
		require("neo-tree").setup({
			filesystem = {
				-- hijack_netrw_behavior = "open_default",
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_hidden = false,
					hide_gitignored = false,
					hide_by_name = { ".git", ".DS_Store" },
					never_show = { ".git", ".DS_Store" },
				},
				follow_current_file = {
					enabled = true, -- find and focus the file in the active buffer every time the current file is changed while the tree is open.
					leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
			},
		})
	end,
}
