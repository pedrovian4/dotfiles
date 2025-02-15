vim.opt.number = true
vim.filetype.add({
    pattern = {
        ["%.blade%.php$"] = "blade",
    },
})
