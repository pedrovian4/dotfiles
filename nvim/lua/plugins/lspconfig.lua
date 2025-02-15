local php_helpers = require("helpers.php")

return {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hint = {
            enabled = true,
            exclude = { "php" },
        },
        servers = {
            phpactor = {
                fileTypes = { "php", "blade" },
            },
        },
    },
}
