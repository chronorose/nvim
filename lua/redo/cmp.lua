-- setting up completion there, pretty much everything is self explanatory tbh
-- the only thing that deviates from standard guides are few remaps and that's it

local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
	  ['<Tab>'] = cmp.mapping.confirm({select = true}),
	  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	  ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
