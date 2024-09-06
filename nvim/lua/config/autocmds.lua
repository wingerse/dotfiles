-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "go",
  callback = function(_)
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 0
    vim.opt.expandtab = false
  end,
})

-- vim.cmd.colorscheme("vscode")

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "go",
  callback = function(_)
    require("lspconfig").gopls.setup({
      settings = {
        gopls = {
          buildFlags = { "-tags=integrationtests" },
          -- disable linters. Use golangcilint instead
          analyses = {
            ["appends"] = false,
            ["asmdecl"] = false,
            ["assign"] = false,
            ["atomic"] = false,
            ["atomicalign"] = false,
            ["bools"] = false,
            ["buildtag"] = false,
            ["cgocall"] = false,
            ["composites"] = false,
            ["copylocks"] = false,
            ["deepequalerrors"] = false,
            ["defers"] = false,
            ["deprecated"] = false,
            ["directive"] = false,
            ["embed"] = false,
            ["errorsas"] = false,
            ["fillreturns"] = false,
            ["framepointer"] = false,
            ["httpresponse"] = false,
            ["ifaceassert"] = false,
            ["infertypeargs"] = false,
            ["loopclosure"] = false,
            ["lostcancel"] = false,
            ["nilfunc"] = false,
            ["nilness"] = false,
            ["nonewvars"] = false,
            ["noresultvalues"] = false,
            ["printf"] = false,
            ["shadow"] = false,
            ["shift"] = false,
            ["sigchanyzer"] = false,
            ["simplifycompositelit"] = false,
            ["simplifyrange"] = false,
            ["simplifyslice"] = false,
            ["slog"] = false,
            ["sortslice"] = false,
            ["stdmethods"] = false,
            ["stdversion"] = false,
            ["stringintconv"] = false,
            ["structtag"] = false,
            ["stubmethods"] = false,
            ["testinggoroutine"] = false,
            ["tests"] = false,
            ["timeformat"] = false,
            ["undeclaredname"] = false,
            ["unmarshal"] = false,
            ["unreachable"] = false,
            ["unsafeptr"] = false,
            ["unusedparams"] = false,
            ["unusedresult"] = false,
            ["unusedvariable"] = false,
            ["unusedwrite"] = false,
            ["useany"] = false,
          },
        },
      },
    })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "python",
  callback = function(_)
    require("lspconfig").ruff.setup({
      init_options = {
        settings = {
          lint = {
            enable = false,
          },
        },
      },
    })
  end,
})
