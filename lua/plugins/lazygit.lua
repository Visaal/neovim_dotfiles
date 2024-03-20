return {
	"kdheepak/lazygit.nvim",
	vim.keymap.set("n", "<leader>lg", "<cmd> LazyGit <CR>", { desc = "Open lazygit" }),
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
