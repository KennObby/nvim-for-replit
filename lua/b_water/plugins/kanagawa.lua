return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1001,  -- make sure it loads first
    lazy = false,     -- don’t delay, colorscheme must load early
    config = function()
      require("kanagawa").setup({
        compile = false,
        transparent = true,  -- <== this handles transparency for you
        theme = "wave",      -- or "dragon", "lotus" (pick your favorite)
        background = {
          dark = "wave",     -- default dark style
          light = "lotus",
        },
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
};
