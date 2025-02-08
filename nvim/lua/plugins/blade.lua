return {
  {
    "jwalton512/vim-blade",
    ft = "blade",
    init = function()
      vim.g.blade_custom_directives_pairs = {
        php = "endphp"
      }
    end
  },
}
