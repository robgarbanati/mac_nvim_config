local luasnip = require 'luasnip'
-- Jump forward
vim.keymap.set('i', '<C-l>', function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, {silent = true})
-- Jump backward
vim.keymap.set('i', '<C-h>', function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, {silent = true})
