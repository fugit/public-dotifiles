-- If you'd rather extend the default config, use the code below instead:
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "hcl",
        "markdown",
        "markdown_inline",
        "terraform",
      })
    end,
  },
}
