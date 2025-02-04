return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true, -- save state on window toggle
      },
    })
    local toggle_opts = {
      title_pos = "center",
      height_in_lines = 20,
      border = "rounded",
    }
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "add buffer to harpoon" })
    vim.keymap.set("n", "<leader>sh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
    end, { desc = "toggle Harpoon menu" })
  end,
}
