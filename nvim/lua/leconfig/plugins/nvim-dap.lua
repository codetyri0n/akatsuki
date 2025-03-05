return {
    "mfussenegger/nvim-dap",
    event = "BufRead",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "folke/neodev.nvim",
        "nvim-neotest/nvim-nio"
    },
local dap = require('dap')

dap.configurations.java = {
    {
        type = 'java',
        request = 'launch',
        name = 'Launch Java Program'
    },
}

vim.fn.sign_define('DapBreakpoint',
    {
        text = '🔴',
        texthl = 'DapBreakpointSymbol',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint'
    })
vim.fn.sign_define('DapStopped',
    {
        texthl = 'DapStoppedSymbol',
        linehl = 'CursorLine',
        numhl = 'DapBreakpoint'
    })

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)

local dapui = require('dapui')
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    --dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    --dapui.close()
end

vim.keymap.set('n', '<Leader>du', function() dapui.toggle() end)

}
