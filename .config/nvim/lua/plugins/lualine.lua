return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies  = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            local theme = require'lualine.themes.auto'
            theme.normal.c.bg = 'none'
            theme.insert.c.bg = 'none'
            theme.visual.c.bg = 'none'
            --theme.replace.c.bg = 'none'
            theme.command.c.bg = 'none'
            theme.inactive.c.bg = 'none'
            -- for _, mode in ipairs({"normal", "insert", "visual", "command", "inactive"}) do
            --     theme[mode].c.bg = 'none'
            -- end
           require('lualine').setup({ options = {theme = theme}})
        end
    }
}
