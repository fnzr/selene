return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require'dap'
            dap.adapters.php = {
                type = 'executable',
                command = 'node',
                args = {'/usr/lib/node_modules/php-debug/out/phpDebug.js'},
            }

            dap.adapters.node = {
                type = "executable",
                name = "node-debug",
                command = "node",
                args= {"/home/master/.local/share/nvim/lazy/vscode-js-debug/out/src/vsDebugServer.js", "45635" }
            }

            -- dap.configurations.php = {
            --     {
            --         type = 'php',
            --         request = 'launch',
            --         name = 'Listen for xdebug',
            --         port = '9000',
            --         log = true,
            --         serverSourceRoot = '/api/',
            --         localSourceRoot = '/home/master/HackeandoProcessos/dealwise/api',
            --     },
            -- }
            require('mason-nvim-dap').default_setup({}) -- don't forget this!
            require('dap.ext.vscode').load_launchjs()

            require("nvim-dap-virtual-text").setup()
            vim.keymap.set('n', '<F5>', require 'dap'.continue)
            vim.keymap.set('n', '<F10>', require 'dap'.step_over)
            vim.keymap.set('n', '<F11>', require 'dap'.step_into)
            vim.keymap.set('n', '<F12>', require 'dap'.step_out)
            vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

        end
    },
    { 'rcarriga/nvim-dap-ui' },
    {
        'folke/neodev.nvim',
        config = function()
            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true }
            })
        end
    },
    { 'theHamsta/nvim-dap-virtual-text',
    'jay-babu/mason-nvim-dap.nvim'
    },
    {
        "microsoft/vscode-js-debug",
        lazy = true,
        build = "npm install --legacy-peer-deps && npm run compile"
    },
    {
        'mxsdev/nvim-dap-vscode-js',
        requires = {'mfussenegger/nvim-dap'},
        config = function()
            require('dap-vscode-js').setup({
                debugger_path = "/home/master/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
                adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
            })
            for _, language in ipairs({ "typescript", "javascript", "vue"}) do
                require("dap").configurations[language] = {
                    {
                        type = "pwa-chrome",
                        request = "launch",
                        name = "Launch Chrome",
                        url = 'http://localhost:3000'
                    },
                    {
                        type = "pwa-chrome",
                        request = "attach",
                        name = "Attach Chrome",
                        port = 9222
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require'dap.utils'.pick_process,
                    }
                }
            end
        end
    }
}
