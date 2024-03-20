return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls") -- NOTE: forked project uses null-ls instead of none-ls
    local b = null_ls.builtins

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    -- auto formats code when saving
    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end
    -- NOTE: need to install formatters and linters manually via Mason
    null_ls.setup({
      sources = {
        b.formatting.prettier.with({
          filetypes = {
            "html",
            "css",
            "javascript",
            "javascriptreact",
            "json",
            "jsonc",
            "typescript",
            "typescriptreact",
          },
        }), -- so prettier works only on these filetypes
        b.formatting.prettier.with({
          disabled_filetypes = { "markdown" },
        }),
        -- Lua
        b.formatting.stylua,
        -- GO
        b.formatting.gofmt,
        b.formatting.goimports,
        -- Python
        b.formatting.black,
        b.formatting.isort,
      },
      on_attach = on_attach,
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "format code" })
  end,
}
