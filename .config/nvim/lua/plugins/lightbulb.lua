return {
    {
        'kosayoda/nvim-lightbulb',
        config = function()
            require("nvim-lightbulb").setup({
                virtual_text = {
                    enabled = false
                }
            })
        end
    }
}
