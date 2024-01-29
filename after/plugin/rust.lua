local rt = require'rust-tools'

vim.keymap.set('n', '<leader><leader>h', ":lua require'rust-tools'.inlay_hints.enable()<CR>")
vim.keymap.set('n', '<leader><leader>H', ":lua require'rust-tools'.inlay_hints.disable()<CR>")
function joinlines()
  if vim.bo.filetype == 'rust' then
    vim.cmd('RustJoinLines')
  else
    vim.cmd('join')
  end
end
vim.keymap.set('n', 'J', joinlines)

rt.setup{ }

