local dap = require'dap'
local dapui = require"dapui"
dapui.setup({
    
})

dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
    dapui.close()
end

local set_namespace = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local namespace = vim.api.nvim_create_namespace("dap-hlng")

vim.api.nvim_set_hl(namespace, 'DapBreakpoint', { ctermbg = 0, fg = '#F23A71', bg = '#F23A71' })
vim.api.nvim_set_hl(namespace, 'DapLogPoint', { fg = '#eaeaeb', bg = '#ffffff' })
vim.api.nvim_set_hl(namespace, 'DapStopped', { fg = '#eaeaeb', bg = '#ffffff' })

vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

vim.fn.sign_define('DapBreakpointCondition', { text = '❓', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text = '‼️', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '💬', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '🚥', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.toggle_breakpoint(nil, nil, vim.fn.input('Log message: ')<CR>")
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader><F12>", ":lua require'dap'.step_out()<CR>")

require 'dap-go'.setup()
require 'rust-tools'.setup()
dap.adapters.lldb = {
	type = "executable",
	command = "/opt/homebrew/opt/llvm/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

local lldb = {
	name = "Launch lldb",
	type = "lldb", -- matches the adapter
	request = "launch", -- could also attach to a currently running process
	program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}
for _, language in ipairs({"c", "cpp", "rust"}) do
    dap.configurations[language] = {lldb}
end
for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
        {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
            {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require 'dap.utils'.pick_process,
                cwd = "${workspaceFolder}",
            }
        }
    }
end
