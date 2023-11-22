local comments = require'todo-comments'
comments.setup{}

vim.keymap.set("n", "]t", function()
  comments.jump_next()
end, { desc = "Next todo comment" })

-- TODO
vim.keymap.set("n", "[t", function()
  comments.jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<leader>t", "<cmd>TodoTelescope<CR>", { desc = "Show all todos" })

