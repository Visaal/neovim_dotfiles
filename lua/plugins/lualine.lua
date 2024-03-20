return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = {
			black = "#282828",
			white = "#ebdbb2",
			red = "#fb4934",
			green = "#b8bb26",
			blue = "#83a598",
			yellow = "#fe8019",
			gray = "#a89984",
			darkgray = "#3c3836",
			lightgray = "#504945",
			inactivegray = "#7c6f64",
			darkerBackground = "#242b40",
			base0D = "#77aed7",
			strings = "#f2c37b",
			warning = "#fcc04f",
			success = "#0ec05c",
			cyan = "#22ECDB",
			purple = "#B788E5",
			orange = "#FF955C",
			base0C = "#77aed7",
			light = "#4f5e8c",
		}
		local neo_blue = {
			normal = {
				a = { bg = colors.base0D, fg = colors.black, gui = "bold" },
				b = { bg = colors.light, fg = colors.white },
				c = { bg = colors.darkerBackground, fg = colors.gray },
			},
			insert = {
				a = { bg = colors.purple, fg = colors.black, gui = "bold" },
				b = { bg = colors.light, fg = colors.white },
				c = { bg = colors.darkerBackground, fg = colors.gray },
			},
			visual = {
				a = { bg = colors.cyan, fg = colors.black, gui = "bold" },
				b = { bg = colors.light, fg = colors.white },
				c = { bg = colors.darkerBackground, fg = colors.gray },
			},
			replace = {
				a = { bg = colors.orange, fg = colors.black, gui = "bold" },
				b = { bg = colors.light, fg = colors.white },
				c = { bg = colors.darkerBackground, fg = colors.gray },
			},
			command = {
				a = { bg = colors.success, fg = colors.black, gui = "bold" },
				b = { bg = colors.light, fg = colors.white },
				c = { bg = colors.darkerBackground, fg = colors.gray },
			},
			inactive = {
				a = { bg = colors.dark, fg = colors.gray, gui = "bold" },
				b = { bg = colors.dark, fg = colors.gray },
				c = { bg = colors.darkerBackground, fg = colors.gray },
			},
		}
		require("lualine").setup({
			options = {
				theme = neo_blue,
			},
			disabled_filetypes = { "Neotree", "neo-tree" },
			sections = {
				lualine_a = { { icon = "", "mode" } },
				lualine_b = { { icon = "󱧶", "filename", path = 1 } },
				lualine_c = { { "branch", icon = "" } },
				lualine_x = { "encoding", "filetype" },
			},
		})
	end,
}
