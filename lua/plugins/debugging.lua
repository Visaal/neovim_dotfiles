return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- keymaps for mfussenegger/nvim-dap
		vim.keymap.set("n", "<leader>bp", ":DapToggleBreakpoint<CR>", { desc = "toggle breakpoint" })

		-- keymaps for rcarriga/nvim-dap-ui
		vim.keymap.set("n", "<leader>td", function()
			require("dapui").toggle()
		end, { desc = "toggle debugging ui" })

		-- keymap for leoluz/nvim-dap-go
		vim.keymap.set("n", "<leader>dgt", function()
			require("dap-go").debug_test()
		end, { desc = "Debug go test" })
	end,
}
