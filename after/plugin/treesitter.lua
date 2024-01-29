require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query",
        "javascript", "typescript", "rust", "go", "python", "java",
        "dart", "bash", "c_sharp", "cmake", "cpp", "css", "csv",
        "cuda", "dockerfile", "fish", "git_config", "git_rebase",
        "gitcommit", "gitignore", "gomod", "gowork", "graphql",
        "html", "http", "jsdoc", "json", "latex", "make", "markdown",
        "markdown_inline", "prisma", "regex", "scss", "sql", "svelte",
        "terraform", "toml", "xml", "yaml", "zig"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>]a"] = "@parameter.inner",
                ["<leader>]f"] = "@function.outer",
            },
            swap_previous = {
                ["<leader>[a"] = "@parameter.inner",
                ["<leader>[f"] = "@function.outer",
            },
        },
        move = {
            enable=true,
            goto_next = {
                ["]a"] = "@parameter.inner",
                ["]f"] = "@function.outer",
                ["]]"] = "@block.outer",
            },
            goto_previous = {
                ["[a"] = "@parameter.inner",
                ["[f"] = "@function.outer",
                ["[["] = "@block.outer",
            }
        },
    }
}

require 'treesitter-context'.setup {
    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20,     -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
