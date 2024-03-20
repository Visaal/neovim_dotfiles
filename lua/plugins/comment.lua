return {
	"numToStr/Comment.nvim",
	opts = {
		keys = {
			{ "gcc", mode = "n", desc = "comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "comment toggle linewise" },
			{ "gc", mode = "x", desc = "comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "comment toggle blockwise" },
			{ "gb", mode = "x", desc = "comment toggle blockwise (visual)" },
		},
	},
	config = function()
		require("Comment").setup()
		vim.keymap.set("n", "<leader>/", function()
			require("Comment.api").toggle.linewise.current()
		end, { desc = "comment toggle current line" })
		vim.keymap.set(
			"v",
			"<leader>/",
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			{ desc = "comment toggle current line" }
		)
	end,
}
