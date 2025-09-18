-- lua/b_water/remap.lua
vim.g.mapleader = " "

-- === Window navigation ===
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<leader>s', ':split<CR>')
vim.keymap.set('n', '<leader>o', ':only<CR>')
vim.keymap.set('n', '<leader>lt', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>lf', ':NvimTreeFindFileToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>lq', ':NvimTreeClose<CR>', {noremap = true, silent = true})

-- === Quick splits and buffer management ===
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<leader>s', ':split<CR>')
vim.keymap.set('n', '<leader>o', ':only<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':wq<CR>')
vim.keymap.set('n', '<leader>q', ':q!<CR>')

-- === Terminal ===
vim.keymap.set('n', '<leader>t', ':vsplit | term<CR>')

-- === Editing ===
vim.keymap.set('n', '<S-p>', 'yyp')
vim.keymap.set('v', '<S-p>', 'y`>pgv')
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')

-- === Buffers ===
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>')
vim.keymap.set('n', '<leader>bd', ':bd<CR>')

-- === Config editing ===
vim.keymap.set('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>r', ':vsplit ~/.config/nvim/lua/b_water/remap.lua<CR>')

-- === Map inspection ===
vim.keymap.set('n', '<leader>m', ':map<CR>')
vim.keymap.set('n', '<leader>nm', ':nmap<CR>')
vim.keymap.set('n', '<leader>im', ':imap<CR>')
vim.keymap.set('n', '<leader>vm', ':vmap<CR>')

-- === Git ===
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

-- === Telescope ===
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>lg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fd', function()
  builtin.find_files({
    prompt_title = "< Dotfiles >",
    cwd = "~/.config/nvim",
    hidden = true
  })
end)

-- Telescope file browser
pcall(function()
  local telescope = require("telescope")
  telescope.load_extension('file_browser')
  vim.keymap.set('n', '<leader>fB', function()
    telescope.extensions.file_browser.file_browser({
      path = "~",
      hidden = true,
      respect_gitignore = false
    })
  end)
end)

-- === LSP ===
vim.keymap.set('n', 'gd', function()
  local ok, builtin = pcall(require, 'telescope.builtin')
  if ok and next(vim.lsp.get_active_clients({ bufnr = 0 })) then
    builtin.lsp_definitions()
  else
    vim.lsp.buf.definition()
  end
end)

vim.keymap.set('n', 'gr', function()
  local ok, builtin = pcall(require, 'telescope.builtin')
  if ok and next(vim.lsp.get_active_clients({ bufnr = 0 })) then
    builtin.lsp_references()
  else
    vim.lsp.buf.references()
  end
end)

vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_next)
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)

-- === Harpoon ===
pcall(function()
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")
  vim.keymap.set("n", "<leader>a", mark.add_file)
  vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
  vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
  vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
  vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
  vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
end)

-- === Undotree ===
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
