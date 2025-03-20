local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>D", function()
      vim.cmd("rightbelow vsplit")
      vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>d", function()
      vim.cmd("vsplit")
      vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'lua_ls', 'rust_analyzer', 'clangd', 'pyright'},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        clangd = function()
            require('lspconfig').clangd.setup({
                cmd = { "clangd", "--background-index", "--compile-commands-dir=." },
                capabilities = {
                    offsetEncoding = 'utf-8',
                },
            })
        end,
    },
})

local cmp = require('cmp')
local cmp_insert = {behavior = cmp.SelectBehavior.insert, select = true}
cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_insert),
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_insert),
        ['<C-g>'] = cmp.mapping.confirm({ select = true }),
        ['<C-G>'] = cmp.mapping.complete(),
    }),
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_insert = {behavior = cmp.SelectBehavior.insert, select = true}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_insert),
    ['<C-m>'] = cmp.mapping.select_prev_item(cmp_insert),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<C-g>'] = cmp.mapping.confirm({select = true}),
    ['<C-Y>'] = cmp.mapping.complete(),
  }),
})

lsp_zero.setup()
