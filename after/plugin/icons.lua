require'nvim-web-devicons'.setup {
    override_by_extension = {
        ['luarocks'] = {
            icon = "",
            color = "#750e8c",
            name = "Luarocks"
        },
        ['patch'] = {
            icon = "󰶯",
            name = "Gitpatch"
        }
    },
    override_by_name = {
        ['.luacheckrc'] = {
            icon = "",
            color = "#750e8c",
            name = "Luacheck"
        },
        ['.luacov'] = {
            icon = "",
            color = "#750e8c",
            name = "Luacoverage"
        },
        ['.luarc.json'] = {
            icon = "",
            color = "#750e8c",
            name = "Luarc"
        },
        ['pyproject.toml'] = {
            icon = "",
            color = "#750e8c",
            name = "PyProject"
        }
    }
}
