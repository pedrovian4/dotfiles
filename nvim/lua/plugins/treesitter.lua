return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "LazyFile", "VeryLazy" },
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    opts_extend = { "ensure_installed" },
    opts = {
        ensure_installed = { "php", "html", "css", "javascript", "typescript", "query", "c" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        injections = { enable = true },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
}
