return {
    {'jghauser/mkdir.nvim'},
    {'tpope/vim-surround'},
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    }
}
