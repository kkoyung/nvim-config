-- Setup language servers.
local lspconfig = require("lspconfig")
lspconfig.pyright.setup {}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
lspconfig.yamlls.setup {
  settings = {
    yaml = {
      keyOrdering = false,
    }
  }
}
lspconfig.ltex.setup {
  settings = {
    ltex = {
      language = "en-US",
    }
  }
}
lspconfig.texlab.setup {
  settings = {
    texlab = {
      build = {
        forwardSearchAfter = vim.g.hasGUI,
        onSave = true,
      },
      forwardSearch = {
        -- From nvim-texlspconfig
        executable = "zathura",
        args = {
          '--synctex-editor-command',
          '"' .. require('texlabconfig').project_dir() .. [[/nvim-texlabconfig -file '%{input}' -line %{line} -server ]] .. vim.v.servername .. '"',
          '--synctex-forward',
          '%l:1:%f',
          '%p',
        }
      }
    }
  }
}
-- lspconfig.rust_analyzer.setup { }
-- Assisted by rust-tools.nvim

-- Setup null-ls
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
null_ls.setup {
  sources = {
    formatting.markdownlint.with({ extra_filetypes = { "telekasten" } }),
    diagnostics.markdownlint.with({ extra_filetypes = { "telekasten" } }),
    code_actions.gitsigns,
  },
}

-- UI customization
-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
