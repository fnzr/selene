return {
    {
        'ziontee113/color-picker.nvim',
        lazy = false,
        config = function()
            require('color-picker').setup()
            vim.cmd([[hi FloatBorder guibg=NONE]])
        end
    }
}
