return {
    -- tokyonight
     {
         "folke/tokyonight.nvim",
 --        lazy = true,
         opts = { style = "storm" },
--         priority = 1000, -- make sure to load this before all the other start plugins
--         config = function()
--             vim.cmd('colorscheme tokyonight-storm')
--             vim.cmd('highlight LineNr guifg=#7aa2f7')
--             vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--             vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--         end
     },
    {
        {
            'rose-pine/neovim', name = 'rose-pine',
            config = function()
                require('rose-pine').setup({
                    variant = 'moon',
                    highlight_groups = {
                        Normal = { bg = 'none' },
                        NormalNC = { bg = 'none'},
                        SignColumn = { bg = 'none', blend = 100 },
                        ColorColumn = { blend=50 },
                        StatusLine = { fg = "none", bg = "none", blend= 100},
                        StatusLineNC = { fg = "none", bg = "none" },
                    },
                })
                vim.cmd('colorscheme rose-pine')
            end
        }
    },

    -- catppuccin
    {
        "catppuccin/nvim",
        --lazy = true,
        name = "catppuccin",
        opts = {
            integrations = {
                alpha = true,
                cmp = true,
                gitsigns = true,
                illuminate = true,
                indent_blankline = { enabled = true },
                lsp_trouble = true,
                mason = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                noice = true,
                notify = true,
                neotree = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                which_key = true,
            },
        },
    },
}
