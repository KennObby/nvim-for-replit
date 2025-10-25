return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 15,
    start_in_insert = true,
    shade_terminals = true,
    persist_size = true,
    direction = "float",
    float_opts = { border = "curved", winblend = 3 },
  },
  keys = {
    { "<A-t>", "<cmd>ToggleTerm<cr>",                               mode = { "n","t","i" }, desc = "Terminal (float)" },
    { "<A-v>", "<cmd>ToggleTerm direction=vertical size=50<cr>",    mode = { "n","t","i" }, desc = "Terminal (vsplit)" },
    { "<A-h>", "<cmd>ToggleTerm direction=horizontal size=15<cr>",  mode = { "n","t","i" }, desc = "Terminal (split)" },
    { "<A-1>", "<cmd>1ToggleTerm<cr>",                              mode = { "n","t","i" }, desc = "Terminal #1" },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    local function set_term_nav()
      local o = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], o)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], o)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], o)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], o)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], o)
    end
    vim.api.nvim_create_autocmd("TermOpen", { pattern = "term://*", callback = set_term_nav })
  end,
}
