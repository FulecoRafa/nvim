local telescope = require('telescope')
telescope.setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'bottom'
        }
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "-u" }
        }
    }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>o', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>O', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>gf', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gm', builtin.marks, {})
