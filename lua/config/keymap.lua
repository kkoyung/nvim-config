-- Local variables
local keymap = vim.keymap.set
local function default(desc, opts)
  desc = desc or ""
  opts = opts or {}
  return {
    desc = desc,
    noremap = true,
    silent = true,
    unpack(opts)
  }
end

-- ########## Whichkey ##########
--
keymap("n", "<leader>wK", "<cmd> WhichKey <CR>", default("Which-key all keymaps"))
keymap("n", "<leader>wk",
  function()
    local input = vim.fn.input "WhichKey: "
    vim.cmd("WhichKey " .. input)
  end,
  default("Which-key query lookup"))

-- ########## Editor ##########
--
keymap("v", "<", "<gv") -- shift indentation to the left repeatedly
keymap("v", ">", ">gv") -- shift indentation to the right repeatedly
keymap("v", "J", ":m '>+1<CR>gv=gv") -- move block down
keymap("v", "K", ":m '<-2<CR>gv=gv") -- move block up
keymap("n", "<leader>i4", function()
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4
end, default("Change tab size to 4"))
keymap("n", "<leader>i2", function()
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2
end, default("Change tab size to 2"))

-- ########## Buffer ##########
--
keymap("n", "<leader>q",  "<cmd> Bdelete <CR>",              default("Buffer close"))
keymap("n", "<C-i>",      "<cmd> BufferLineCyclePrev <CR>",  default("Buffer previous"))
keymap("n", "<C-o>",      "<cmd> BufferLineCycleNext <CR>",  default("Buffer next"))
keymap("n", "<leader>bp", "<cmd> BufferLinePick <CR>",       default("buffer pick"))
keymap("n", "<leader>bc", "<cmd> BufferLinePickClose <CR>",  default("Buffer pick close"))
keymap("n", "<leader>bl", "<cmd> BufferLineCloseLeft <CR>",  default("Buffer close left"))
keymap("n", "<leader>br", "<cmd> BufferLineCloseRight <CR>", default("Buffer close right"))

-- ########## Windows ##########
--
keymap("n", "<C-h>", "<C-w>h", default("Windows focus left"))
keymap("n", "<C-j>", "<C-w>j", default("Windows focus below"))
keymap("n", "<C-k>", "<C-w>k", default("Windows focus above"))
keymap("n", "<C-l>", "<C-w>l", default("Windows focus right"))
keymap("n", "<C-Up>",    ":resize -2<CR>",          default("Windows resize up"))
keymap("n", "<C-Down>",  ":resize +2<CR>",          default("Windows resize down"))
keymap("n", "<C-Left>",  ":vertical resize -2<CR>", default("Windows resize left"))
keymap("n", "<C-Right>", ":vertical resize +2<CR>", default("Windows resize right"))

-- ########## NvimTree ##########
--
keymap("n", "<C-n>",     "<cmd> NvimTreeToggle <CR>", default("NvimTree toggle"))
keymap("n", "<leader>e", "<cmd> NvimTreeFocus<CR>",   default("Nvimtree focus"))

-- ########## Terminal ##########
--
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  keymap('t', '<esc>', [[<C-\><C-n>]],        opts)
  keymap('t', 'jk',    [[<C-\><C-n><C-w>k]],  opts)
  keymap('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  keymap('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  keymap('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  keymap('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  keymap('t', '<C-w>', [[<C-\><C-n><C-w>]],   opts)
end
-- if you only want these mappings for toggle term
-- use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
--["<C-`>"] = { "<cmd> ToggleTerm dir=git_dir <CR>", "toggleterm toogle" },
keymap("n", "<leader>tf", "<cmd> ToggleTerm dir=git_dir direction=float <CR>",      default("Terminal toogle float"))
keymap("n", "<leader>th", "<cmd> ToggleTerm dir=git_dir direction=horizontal <CR>", default("Terminal toogle horizontal"))
keymap("n", "<leader>tv", "<cmd> ToggleTerm dir=git_dir direction=vertical <CR>",   default("Terminal toogle vertical"))

-- ########## Telescope ##########
--
keymap("n", "<leader>ff", "<cmd> Telescope find_files <CR>",   default("Telescope find files"))
keymap("n", "<leader>fw", "<cmd> Telescope live_grep <CR>",    default("Telescope find words"))
keymap("n", "<leader>fb", "<cmd> Telescope buffers <CR>",      default("Telescope find buffers"))

-- ########## Comment ##########
--
-- See: `:h comment.keybindings`
local comment_api = require('Comment.api')
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
keymap("n", "<leader>c", comment_api.toggle.linewise.current, default("Comment current"))
keymap('x', '<leader>c', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  comment_api.toggle.linewise(vim.fn.visualmode())
end, default("Comment visual block"))

-- ########## Git integration ##########
--
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  count = 5,
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  -- on_open = function(term)
  --   vim.cmd("startinsert!")
  --   vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  -- end,
  -- function to run on closing the terminal
  -- on_close = function(term)
  --   vim.cmd("startinsert!")
  -- end,
})
function Lazygit_toggle()
  lazygit:toggle()
end
keymap("n", "<leader>gz", "<cmd>lua Lazygit_toggle()<CR>", default("Git lazygit"))
keymap("n", "<leader>gl", "<cmd>Flogsplit<CR>",            default("Git log graph"))
keymap("n", "<leader>gd", "<cmd>DiffviewOpen<CR>",         default("Git diffview open"))
keymap("n", "<leader>gc", "<cmd>DiffviewClose<CR>",        default("Git diffview close"))
keymap("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>",  default("Git diffview history"))

-- ########## Diagnostic ##########
--
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap('n', '<leader>do', vim.diagnostic.open_float, default("Diagnostic open"))
keymap('n', '<leader>dk', vim.diagnostic.goto_prev,  default("Diagnostic previous(k)"))
keymap('n', '<leader>dj', vim.diagnostic.goto_next,  default("Diagnostic next(j)"))
keymap('n', '<leader>dl', vim.diagnostic.setloclist, default("Diagnostic list"))

-- ########## LSP ##########
--
-- See `:help vim.lsp.*` for documentation on any of the below functions
keymap('n', '<leader>gD', vim.lsp.buf.declaration,     default("LSP declaration"))
keymap('n', '<leader>gd', vim.lsp.buf.definition,      default("LSP definition"))
keymap('n', 'K',          vim.lsp.buf.hover,           default("LSP hover"))
keymap('n', '<leader>gi', vim.lsp.buf.implementation,  default("LSP implementation"))
keymap('n', '<leader>lf', function()
  vim.lsp.buf.format { async = true }
end,                                                   default("LSP format"))

-- ########## DAP ##########
--
-- -- See `:help dap-mappings`
-- keymap('n', '<F5>', function() require('dap').continue() end)
-- keymap('n', '<F10>', function() require('dap').step_over() end)
-- keymap('n', '<F11>', function() require('dap').step_into() end)
-- keymap('n', '<F12>', function() require('dap').step_out() end)
-- keymap('n', '<leader>B', function() require('dap').toggle_breakpoint() end)
-- keymap('n', '<leader>B', function() require('dap').set_breakpoint() end)
-- keymap('n', '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- keymap('n', '<leader>dr', function() require('dap').repl.open() end)
-- keymap('n', '<leader>dl', function() require('dap').run_last() end)
-- keymap({'n', 'v'}, '<leader>dh', function()
--   require('dap.ui.widgets').hover()
-- end)
-- keymap({'n', 'v'}, '<leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end)
-- keymap('n', '<leader>df', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end)
-- keymap('n', '<leader>ds', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end)
-- keymap('n', '<leader>du', function() require("dapui").toggle() end, default("Debug UI toogle"))

-- ########## Markdown Preview ##########
--
keymap("n", "<leader>md", "<cmd> MarkdownPreviewToggle <CR>", default("MarkdownPreview Toggle"))

-- ########## Zettelkasten ##########
--
-- Launch panel if nothing is typed after <leader>z
keymap("n", "<leader>zk", "<cmd>Telekasten panel<CR>",              default("Telekasten panel"))
-- Most used functions
keymap("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>",         default("Telekasten find_notes"))
keymap("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>",       default("Telekasten search_notes"))
keymap("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>",         default("Telekasten goto_today"))
keymap("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>",        default("Telekasten follow_link"))
keymap("n", "<leader>zn", "<cmd>Telekasten new_note<CR>",           default("Telekasten new_note"))
keymap("n", "<leader>zt", "<cmd>Telekasten new_templated_note<CR>", default("Telekasten new_templated_note"))
keymap("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>",      default("Telekasten show_calendar"))
keymap("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>",     default("Telekasten show_backlinks"))
keymap("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>",    default("Telekasten insert_img_link"))
-- Call insert link automatically when we start typing a link
keymap("i", "[[",         "<cmd>Telekasten insert_link<CR>",        default("Telekasten insert_link"))

-- ########## Spectre ##########
--
keymap('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>',
    default("Spectre Toggle")
)
keymap('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    default("Spectra search current word")
)
keymap('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>',
    default("Spectre search current word")
)
keymap('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
    default("Spectre search on current file")
)
