return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
		vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")
    vim.keymap.set("n", "<leader>x", ":bp|bd #<CR>", { desc = "close buffer", noremap = true }) -- bp = buffer previous, bd = buffer delete
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})
	end,
}
