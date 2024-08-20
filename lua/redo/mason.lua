require("mason").setup({})
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- TODO: do some handlers for lsp servers that i most oftenly use.
    -- for now, default configuration was ok(the only language it actually sucked was scala)
    -- scala is absolutely another bs tho, the tooling is horseshit
    -- (the language is nice tho)
}
