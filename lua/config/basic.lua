-- Basic editor settings

-- Tab and indent
local tabsize = 4
vim.opt.tabstop = tabsize       -- size of tab charactor in display
vim.opt.softtabstop = tabsize   -- size when pressing <Tab> or <BS>
vim.opt.shiftwidth = tabsize    -- size shifted when indent
vim.opt.shiftround = false      -- round to nearest multiples of shiftwidth
vim.opt.expandtab = true        -- replace tab charactor with space charactors
vim.opt.autoindent = true       -- autoindent
vim.opt.smartindent = true      -- autoindent based on C style
vim.opt.breakindent = true      -- Wrapped line will be visually indented

-- Column
vim.wo.number = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes" -- Keep diagnostics gutter opened

-- Builtin syntax highlighting
vim.opt.syntax = "on"
vim.opt.termguicolors = true

-- Leader key
vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- Detect GUI
if vim.env.DISPLAY ~= nil then
  vim.g.hasGUI = true
else
  vim.g.hasGUI = false
end

-- Clipbaord
vim.o.clipboard = "unnamedplus" -- Use system clipboard by default (Skip `"+`)
