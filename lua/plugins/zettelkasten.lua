return {
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function() vim.g.mkdp_auto_close = 0 end,
  },
  {
    "renerocksai/telekasten.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
    opts = {
      home = vim.fn.expand(vim.env.ZETTELKASTEN_HOME),
      templates = vim.fn.expand(vim.env.ZETTELKASTEN_HOME.."/.template"),
      template_new_note = vim.fn.expand(vim.env.ZETTELKASTEN_HOME.."/.template/permenant.md"),
      template_handling = "prefer_new_note",
      new_note_filename = 'title-uuid',
      new_note_location = "same_as_current",
      filename_space_subst = "-",
      uuid_sep = "-",
      uuid_type = function ()
        local hex = '0123456789abcdef'
        local s = ''
        for _ = 1, 6 do
            local r = math.random(1, #hex)
            s = s .. string.sub(hex, r, r)
        end
        return s
      end,
      calendar_monday = 0, -- start on Sundays
    },
  },
}
