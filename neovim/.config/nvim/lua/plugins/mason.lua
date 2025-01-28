return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "markdownlint",
        "stylua",
        "shellcheck",
        "shfmt",
        "yamllint",
      },
    },
  },
}
