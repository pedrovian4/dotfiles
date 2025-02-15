return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "LazyFile", "VeryLazy" },
        init = function(plugin)
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
        end,
        opts_extend = { "ensure_installed" },
        opts = {
            ensure_installed = { "php", "html", "css", "javascript", "typescript", "query", "c", "blade" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            injections = {
                enable = true,
            },
        },
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        config = function(_, opts)
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade",
            }

            vim.filetype.add({
                pattern = {
                    [".*%.blade%.php"] = "blade",
                },
            })

            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/playground",
    },
}
