return {
    {
        'MunifTanjim/prettier.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('prettier').setup({
                bin = 'prettierd',
                filetypes = {
                    "css",
                    "graphql",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "json",
                    "less",
                    "markdown",
                    "scss",
                    "typescript",
                    "typescriptreact",
                    "yaml",
                    "vue",
                },
                cli_options = {
                    arrow_parens = "always",
                    bracket_spacing = true,
                    bracket_same_line = false,
                    embedded_language_formatting = "auto",
                    jsx_single_quote = false,
                    print_width = 80,
                    prose_wrap = "preserve",
                    quote_props = "as-needed",
                    semi = true,
                    single_attribute_per_line = false,
                    single_quote = false,
                    tab_width = 4,
                    trailing_comma = "es5",
                    use_tabs = false,
                    vue_indent_script_and_style = true,
                },
            })
        end
    }
}
