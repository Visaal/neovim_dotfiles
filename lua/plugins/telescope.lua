return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help" })
			vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "find in current buffer" })
			vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "grep string" })
			vim.keymap.set("v", "<leader>fs", builtin.grep_string, { desc = "grep string" })
			vim.keymap.set("n", "<leader>rf", builtin.resume, { desc = "resume find" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim", -- lets neovim core features like code actions use the telescope UI
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = {
					layout_strategy = "horizontal",
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
