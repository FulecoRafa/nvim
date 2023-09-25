vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "U", ":m '<-2<CR>gv=gv")

-- Fix J
vim.keymap.set("n", "J", "mzJ`z")
-- Fix scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--Fix search scroll
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allow replace without losing text
vim.keymap.set("x", "gr", "\"_dP")

-- Copy to OS clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Not going into Q ever again
vim.keymap.set("n", "Q", "<nop>")

-- Autoformat
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

-- Quickfix navigation
-- This uses the foward and backward symbols in my keyboard hehe
vim.keymap.set("n", "<F7>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<F9>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<F8>", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<F10>", "<cmd>lnext<CR>zz")
