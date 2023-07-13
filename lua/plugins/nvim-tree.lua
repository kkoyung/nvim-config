return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true

      require("nvim-tree").setup {
        diagnostics = { enable = true },
      }

      -- Workaround when using rmagatti/auto-session
      -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
      --
      -- There is currently an issue with restoring nvim-tree fully when using 
      -- rmagatti/auto-session. Upon restoring the session, nvim-tree buffer will be 
      -- empty, sometimes positioned in strange places with random dimensions. This 
      -- issue only happens when saving session with nvim-tree open. To prevent this 
      -- from happening you can use the following autocmd:
      --
      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        pattern = 'NvimTree*',
        callback = function()
          local view = require('nvim-tree.view')
          local is_visible = view.is_visible()

          local api = require('nvim-tree.api')
          if not is_visible then
            api.tree.open()
          end
        end,
      })
    end,
  },
}
