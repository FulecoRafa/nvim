local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
local lspkind = require('lspkind')

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                return vim_item
            end
        })
    }
})

lsp.set_sign_icons({
    error = "💢",
    warn = "⚠️",
    hint = "ℹ️",
    info = "✍︎"
})

function on_attach(client, bufnr)
    local options = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, options)
    vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, options)
    vim.keymap.set("n", "<C-k>", function() vim.diagnostic.open_float() end, options)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, options)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, options)
    vim.keymap.set("n", "<leader>.", function() vim.cmd.CodeActionMenu() end, options)
    vim.keymap.set("v", "<leader>.", function() vim.cmd.CodeActionMenu() end, options)
    -- vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, options)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, options)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, options)
end

lsp.on_attach(on_attach)

lsp.setup()

require("mason").setup()
require("mason-lspconfig").setup({
    -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    ensure_installed = {
        "arduino_language_server",
        "bashls",
        "clangd",
        "unocss",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "emmet_ls",
        "graphql",
        "html",
        "jsonls",
        "jdtls", -- Java
        "tsserver",
        "ltex",
        "lua_ls",
        "marksman",             -- Markdown
        "spectral",             -- OpenAPI
        "prismals",
        "jedi_language_server", --python
        "rust_analyzer",
        "sqlls",
        "svelte",
        "taplo",                 -- TOML
        "terraformls", "tflint", --terraform
        "lemminx",               -- XML
        "yamlls",
    }
})
require("mason-nvim-dap").setup({
    ensure_installed = {
        "python",
        "delve",
        "node2",
        "chrome",
        "codelldb",
        "javadbg",
        "dart"
    }
})
require 'lspconfig'.gopls.setup {}
require 'lspconfig'.ltex.setup {
    settings = {
        ltex = {
            language = "en-GB",
        },
    },
    on_attach = on_attach
}
