vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.cmd('syntax on')
vim.o.mouse = 'a'
vim.o.scrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.clipboard = 'unnamedplus'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.undofile = true
vim.o.showmatch = true
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.timeoutlen = 500

vim.cmd([[
    autocmd Filetype c setlocal cindent tabstop=4 shiftwidth=4 noexpandtab
    autocmd Filetype cpp setlocal cindent tabstop=4 shiftwidth=4 noexpandtab
    autocmd FileType rs setlocal tabstop=4 shiftwidth=4 noexpandtab
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
    autocmd FileType javascript,typescript setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd BufRead,BufNewFile *.conf set filetype=conf
    autocmd BufRead,BufNewFile *.json set filetype=json
    autocmd BufRead,BufNewFile *.yaml set filetype=yaml
]])

if vim.lsp.util.apply_text_edits == nil and vim.lsp.util.apply_text_document_edits ~= nil then
  vim.lsp.util.apply_text_edits = function(edits, bufnr, offset_encoding)
    vim.lsp.util.apply_text_document_edits({ edits = edits }, bufnr, offset_encoding)
  end
end
