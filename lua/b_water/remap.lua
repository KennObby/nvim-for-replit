local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

vim.g.mapleader = " "

-- === Window navigation & management ===
map("n", "<C-h>", "<C-w>h", "Window left")
map("n", "<C-j>", "<C-w>j", "Window down")
map("n", "<C-k>", "<C-w>k", "Window up")
map("n", "<C-l>", "<C-w>l", "Window right")
map("n", "<leader>v", function() vim.cmd.vsplit() end, "Vertical split")
map("n", "<leader>s", function() vim.cmd.split() end, "Horizontal split")
map("n", "<leader>o", "<C-w>o", "Only this window")

-- Resize windows quickly
map("n", "<A-Left>",  "<C-w><")        -- Alt+Arrow resize
map("n", "<A-Right>", "<C-w>>")
map("n", "<A-Up>",    "<C-w>+")
map("n", "<A-Down>",  "<C-w>-")

-- NvimTree
map("n", "<leader>lt", "<cmd>NvimTreeToggle<cr>", "NvimTree toggle")
map("n", "<leader>lf", "<cmd>NvimTreeFindFileToggle<cr>", "NvimTree find file")
map("n", "<leader>lq", "<cmd>NvimTreeClose<cr>", "NvimTree close")

-- === Files / write / quit (safer) ===
map("n", "<leader>w",  "<cmd>w<cr>",  "Write")
map("n", "<leader>x",  "<cmd>wqa<cr>","Write & quit all")
map("n", "<leader>qq", "<cmd>q<cr>",  "Quit")
map("n", "<leader>Q",  "<cmd>qa!<cr>","Force quit all")

-- === Terminal ===
map("n", "<leader>t", "<cmd>vsplit | terminal<cr>", "Open terminal (vsplit)")
-- Make terminal behave like a pane
map("t", "<Esc>", [[<C-\><C-n>]], "Terminal normal mode")
map("t", "<C-h>", [[<C-\><C-n><C-w>h]], "Terminal window left")
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], "Terminal window down")
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], "Terminal window up")
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], "Terminal window right")

-- === Editing / Block management ===
-- Duplicate current line / selection
map("n", "<S-p>", "yyp", "Duplicate line below")
map("v", "<S-p>", "y`>pgv", "Duplicate selection below and reselect")

-- Move lines/blocks up/down (works in normal/visual)
map("n", "<A-j>", ":m .+1<CR>==", "Move line down")
map("n", "<A-k>", ":m .-2<CR>==", "Move line up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move block down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move block up")

-- Keep visual selection when indenting
map("v", "<", "<gv", "Indent left (keep selection)")
map("v", ">", ">gv", "Indent right (keep selection)")

-- System clipboard helpers (optional but handy)
map({ "n", "v" }, "<leader>y", [["+y]], "Yank to system clipboard")
map("n", "<leader>Y", [["+Y]], "Yank line to system clipboard")
map({ "n", "v" }, "<leader>p", [["+p]], "Paste from system clipboard")

-- === Buffers ===
-- NOTE: <C-Tab> is unreliable in many terminals; provide fallbacks
map("n", "<leader>bn", "<cmd>bnext<cr>", "Next buffer")
map("n", "<leader>bp", "<cmd>bprevious<cr>", "Prev buffer")
map("n", "<leader>bd", "<cmd>bdelete<cr>", "Delete buffer")
-- If you use bufferline, these are nice:
-- map("n", "]b", "<cmd>BufferLineCycleNext<cr>", "Buffer next")
-- map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", "Buffer prev")

-- === Config editing ===
map("n", "<leader>ev", "<cmd>vsplit ~/.config/nvim/init.lua<cr>", "Edit init.lua")
map("n", "<leader>er", "<cmd>vsplit ~/.config/nvim/lua/b_water/remap.lua<cr>", "Edit remap.lua")

-- === Map inspection ===
map("n", "<leader>m",  "<cmd>map<cr>",  "Map list")
map("n", "<leader>nm", "<cmd>nmap<cr>", "Normal mode maps")
map("n", "<leader>im", "<cmd>imap<cr>", "Insert mode maps")
map("n", "<leader>vm", "<cmd>vmap<cr>", "Visual mode maps")

-- === Git (fugitive) ===
map("n", "<leader>gs", vim.cmd.Git, "Git status")

-- === Telescope ===
local ok_telescope, builtin = pcall(require, "telescope.builtin")
if ok_telescope then
  map("n", "<leader>ff", builtin.find_files, "Find files")
  map("n", "<leader>lg", builtin.live_grep,  "Live grep")
  map("n", "<leader>fb", builtin.buffers,    "Buffers")
  map("n", "<leader>fr", builtin.oldfiles,   "Recent files")
  map("n", "<leader>fh", builtin.help_tags,  "Help tags")
  map("n", "<leader>fd", function()
    builtin.find_files({
      prompt_title = "< Dotfiles >",
      cwd = vim.fn.expand("~/.config/nvim"),
      hidden = true,
    })
  end, "Find in dotfiles")
  -- File browser (if the extension is installed)
  pcall(function()
    local telescope = require("telescope")
    telescope.load_extension("file_browser")
    map("n", "<leader>fB", function()
      telescope.extensions.file_browser.file_browser({
        path = vim.fn.expand("~"),
        hidden = true,
        respect_gitignore = false,
      })
    end, "File browser")
  end)
end

-- === LSP ===
-- Use Telescope pickers if LSP is active, else raw LSP calls
local function has_lsp()
  return next(vim.lsp.get_active_clients({ bufnr = 0 })) ~= nil
end

map("n", "gd", function()
  if ok_telescope and has_lsp() then builtin.lsp_definitions() else vim.lsp.buf.definition() end
end, "Go to definition")

map("n", "gr", function()
  if ok_telescope and has_lsp() then builtin.lsp_references() else vim.lsp.buf.references() end
end, "References")

map("n", "K", vim.lsp.buf.hover, "Hover")
map("n", "<leader>vca", vim.lsp.buf.code_action, "Code action")
map("n", "<leader>vrn", vim.lsp.buf.rename, "Rename")
map("n", "<leader>vd",  vim.diagnostic.open_float, "Line diagnostics")

-- Conventional: ]d next, [d prev
map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")

-- Optional niceties (Neovim 0.10+)
if vim.lsp.inlay_hint then
  map("n", "<leader>vih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
  end, "Toggle inlay hints")
end
map("n", "<leader>vf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

-- === Harpoon ===
-- Avoid conflict with <C-hjkl> window nav; use <leader>1..4 to jump
pcall(function()
  local mark = require("harpoon.mark")
  local ui   = require("harpoon.ui")
  map("n", "<leader>a", mark.add_file, "Harpoon add")
  map("n", "<C-e>", ui.toggle_quick_menu, "Harpoon menu")
  map("n", "<leader>1", function() ui.nav_file(1) end, "Harpoon 1")
  map("n", "<leader>2", function() ui.nav_file(2) end, "Harpoon 2")
  map("n", "<leader>3", function() ui.nav_file(3) end, "Harpoon 3")
  map("n", "<leader>4", function() ui.nav_file(4) end, "Harpoon 4")
end)

-- === Undotree ===
map("n", "<leader>u", vim.cmd.UndotreeToggle, "Undotree toggle")

