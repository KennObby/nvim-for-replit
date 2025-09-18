vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")
require("lazy").setup("b_water.plugins")
require("b_water.settings")
require("b_water.remap")

