return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.diagnostics.puppet_lint,
          nls.builtins.diagnostics.yamllint,
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.puppet_lint,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.stylua,
          -- nls.builtins.diagnostics.flake8,
          -- nls.builtins.diagnostics.terraform_fmt,
          -- nls.builtins.formatting.terraform_fmt,
        },
      }
    end,
  },
}
