return {
	"rmagatti/auto-session",
	config = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		require("auto-session").setup({
			auto_clean_after_session_restore = false,
			pre_save_cmds = { "Neotree close" }, -- important as neo tree does not save correctly
			vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
				noremap = true,
			}),
		})
	end,
}
