return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.ai').setup()
--            require('mini.completion').setup()
            require('mini.comment').setup()
            require('mini.cursorword').setup()
            require('mini.move').setup()
            require('mini.pairs').setup()
            require('mini.sessions').setup()
            require('mini.splitjoin').setup()
            require('mini.trailspace').setup()
            require('mini.surround').setup()
            require('mini.jump').setup()
            require('mini.indentscope').setup()
        end
    }
}

