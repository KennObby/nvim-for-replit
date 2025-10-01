return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false;
    lazy = false,      -- don't delay the colorscheme
    config = function()
      -- important for true colors
      vim.opt.termguicolors = true

      require("catppuccin").setup({
        flavour = "mocha",            -- use this instead of vim.g.catppuccin_flavour
        transparent_background = true,   -- try false first; transparency often causes “white” areas
        styles = {
          comments  = { "italic" },
          keywords  = { "bold" },
          functions = { "bold" },
          conditionals = { "bold" },
        },
        integrations = {
          treesitter = true,
          treesitter_context = true,
          native_lsp = {
            enabled = true,
            -- this boosts differentiation on 0.11 semantic tokens
            virtual_text = { errors = { "italic" }, warnings = { "italic" }, hints = { "italic" }, information = { "italic" } },
            underlines  = { errors = { "underline" }, warnings = { "underline" }, hints = { "underline" }, information = { "underline" } },
            inlay_hints = { background = true },
          },
          cmp = true,
          telescope = true,
          nvimtree = true,
          which_key = true,
          bufferline = true,
          lualine = true,
          noice = true,
          notify = true,
          dashboard = false,   -- for nvimdev/dashboard-nvim
          harpoon = true,
          gitsigns = true,
          mason = true,
          dap = true,
          dap_ui = true,
        },
      })

      -- you can also use "catppuccin-macchiato" directly if you want
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
