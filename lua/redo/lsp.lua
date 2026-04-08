vim.lsp.enable({'clangd', 'nil_ls', 'hls', 'jdtls', 'rust_analyzer', 'gopls', 'dockerls', 'basedpyright' })

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = {
    current_line = true,
  },
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

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
