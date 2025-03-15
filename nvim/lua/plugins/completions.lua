return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/tex" })

			-- Yes, we're just executing a bunch of Vimscript, but this is the officially
			-- endorsed method; see https://github.com/L3MON4D3/LuaSnip#keymaps
			vim.keymap.set(
				"n",
				"<C-S>L",
				'<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>'
			)
			vim.cmd([[
      " Use Tab to expand and jump through snippets
        imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
        smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

        " Use Shift-Tab to jump backwards through snippets
        imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
        smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
      ]])
			require("luasnip").config.set_config({ -- Setting LuaSnip config

				-- Enable autotriggered snippets
				enable_autosnippets = true,

				update_events = "TextChanged,TextChangedI",
				-- Use Tab (or some other key if you prefer) to trigger visual selection
				store_selection_keys = "<Tab>",
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")
			-- local cmp_act = lsp.cmp_action()
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
					["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
				}),

				-- mapping = cmp.mapping.preset.insert({
				-- 	["<C-Space>"] = cmp.mapping.complete(),
				-- 	["<CR>"] = cmp.mapping.confirm({ select = true }),
				-- 	["<C-f>"] = cmp_act.luasnip_jump_forward(),
				-- 	["<C-b>"] = cmp_act.luasnip_jump_backward(),
				-- 	["<C-u>"] = cmp.mapping.scroll_docs(-4),
				-- 	["<C-d>"] = cmp.mapping.scroll_docs(4),
				-- 	["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
				-- 	["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
				-- }),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
