local api = require'nvim-tree.api'
require("nvim-tree").setup({
    -- update_focused_file = {
    --     enable = true
    -- }
})
vim.keymap.set('n', '<leader>e', api.tree.toggle, {})
vim.keymap.set('n', '<leader>w', function () api.tree.toggle({find_file = true}) end, {})
