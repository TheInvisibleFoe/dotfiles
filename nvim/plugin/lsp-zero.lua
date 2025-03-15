local lsp = require('lsp-zero').preset({
    name = 'recommended'
})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
    servers = {
        ['lua_ls'] = { 'lua' },
        -- ['rust_analyzer'] = { 'rust' },
        ['pyright'] = { 'py' },
        ['html'] = { 'html', 'htm' },
        ['clangd'] = { 'c', 'cpp' },
        ['texlab'] = { 'tex' },
    }
})
lsp.ensure_installed({
    'pyright',
    'clangd',
    'lua_ls',
    'texlab',
    'html',
})
local cmp = require('cmp')
local cmp_act = lsp.cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-f>'] = cmp_act.luasnip_jump_forward(),
        ['<C-b>'] = cmp_act.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    }
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()
