return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end, { desc = "add buffer to harpoon" })
		vim.keymap.set("n", "<leader>sh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "toggle Harpoon menu" })
	end,
}
