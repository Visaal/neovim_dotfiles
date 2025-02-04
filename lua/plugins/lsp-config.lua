return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "ts_ls", "html", "cssls", "eslint" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- uses cmp-nvim-lsp from completions.lua to get suggestions from the LSP
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "show hover" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "go to implementation" })
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, { desc = "list workspace folders" })
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "go to type definition" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "references" })
		end,
	},
}
