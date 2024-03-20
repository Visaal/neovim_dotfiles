return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		require("copilot.vim").setup()
		-- copilot - stop clash with the tab key
		vim.g.copilot_assume_mapped = true
		vim.g.copilot_no_tab_map = true
	end,
	-- map C-A to accept the suggestion
	vim.cmd([[imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")]]),
}
