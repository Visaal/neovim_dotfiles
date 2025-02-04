local opt = vim.opt
local g = vim.g
local k = vim.keymap

-- set leader key
g.mapleader = " "

-- Indenting
opt.expandtab = true -- same as writing vim.cmd("set expandtab")
opt.shiftwidth = 2 -- same as vim.cmd("set shiftwidth=2")
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

vim.cmd("set number")
opt.clipboard = "unnamedplus" -- IMPORTANT - yanked text goes to clipboard
opt.termguicolors = true
opt.fillchars = { eob = " " } -- hide ~ at end of file
opt.shortmess:append("sI") -- disable intro message
opt.ignorecase = true
opt.smartcase = true

-- Use undotree for backups rather than vim
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/nvim-custom/undodir"
opt.undofile = true

-- Scrolloff sets the amount of lines to show above and below the cursor
-- useful when using z > CR as this won't go to the very top of screen
opt.scrolloff = 5

-- NORMAL MAPPINGS
k.set("n", ";", ":", { desc = "enter command mode", nowait = true })
k.set("n", "<C-s>", "<cmd> w <CR>", { desc = "save file" })
k.set("n", "<leader>n", "<cmd> set nu! <CR>", { desc = "toggle line number" })
k.set("n", "<Esc>", ":noh <CR>", { desc = "clear highlights" })
k.set("n", "<C-o>", "o<ESC>", { desc = "add blank line below" }) -- this overides the standard C-o which navigates the jumplist
k.set("n", "<C-S-o>", "<S-o> <ESC>", { desc = "add blank line above" }) -- this overides the standard C-o which navigates the jumplist
k.set("n", "<leader>sl", ":vsplit <CR>", { desc = "split buffer vertically" })
k.set("n", "<leader>sj", ":split <CR>", { desc = "split buffer horizontally" })
k.set("n", "≥", "10<C-w>>", { desc = "increase window width" }) -- Alt->
k.set("n", "≤", "10<C-w><", { desc = "decrease window width" }) -- Alt-<
k.set("n", "<C-h>", "<C-w>h", { desc = "window left" })
k.set("n", "<C-l>", "<C-w>l", { desc = "window right" })
k.set("n", "<C-j>", "<C-w>j", { desc = "window down" })
k.set("n", "<C-k>", "<C-w>k", { desc = "window up" })
k.set("n", "<leader>u", "<cmd> UndotreeToggle <CR>", { desc = "toggle undo tree" })
k.set("n", "<leader>sa", "ggVG", { desc = "select all text" })
k.set("n", "<leader>ss", ":SessionDelete <CR> :SessionSave <CR>", { desc = "save session" })

-- NORMAL & VISUAL MAPPINGS
k.set({ "n", "v" }, "∆", "<cmd> +10 <CR> 0", { desc = "jump down 10 lines" }) -- Alt-j
k.set({ "n", "v" }, "˚", "<cmd> -10 <CR> 0", { desc = "jump up 10 lines" }) -- Alt-k
k.set({ "n", "v" }, "p", "p<cmd>let @*=@0<CR>", { desc = "paste and copy 0 reg over to *", noremap = true })

-- INSERT MAPPINGS
k.set("i", "<C-s>", "<Esc> <cmd> w <CR>", { desc = "exit insert & save file" })
k.set("i", "<C-x>", "<Del>", { desc = "delete char" })
k.set("i", "<C-b>", "<ESC>^i", { desc = "beginning of line" })
k.set("i", "<C-e>", "<End>", { desc = "end of line" })

-- TERMINAL MAPPINGS
k.set(
	"t",
	"<C-k>",
	vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>k", true, true, true),
	{ desc = "escape terminal mode and window up" }
)
k.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "escape terminal mode" })

-- Snippet bindings
vim.keymap.set("n", "<leader>gp", "igp<cmd>lua require('luasnip').expand()<cr>", { desc = "go print", noremap = false })
vim.keymap.set("n", "<leader>ge", "ige<cmd>lua require('luasnip').expand()<cr>", { desc = "go error", noremap = false })
vim.keymap.set(
	"n",
	"<leader>gv",
	"igv<cmd>lua require('luasnip').expand()<cr>",
	{ desc = "go variable", noremap = false }
)
