vim.lsp.enable({'clangd', 'nil_ls', 'hls', 'jdtls', 'rust_analyzer', 'gopls'})

-- vim.lsp.config('metals', {})
vim.lsp.config('clangd', {})
vim.lsp.config('nil_ls', {})
vim.lsp.config('hls', {})
vim.lsp.config('jdtls', {})
vim.lsp.config('gopls', {})

vim.lsp.config('rust_analyzer', {})

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})


require('lspconfig')['rust_analyzer'].setup({})
require('lspconfig')['clangd'].setup({})
require('lspconfig')['nil_ls'].setup({})
require('lspconfig')['jdtls'].setup({})
require('lspconfig')['gopls'].setup({})

require('lspconfig')['metals'].setup({
  init_options = {
    statusBarProvider = "off"
  },
})
require('lspconfig')['hls'].setup({})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        local filetype = vim.bo.filetype
        if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" then
            vim.cmd('lua vim.lsp.buf.format()')
        else
        end
    end
})
