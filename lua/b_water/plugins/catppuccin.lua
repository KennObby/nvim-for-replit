return {
{
  "catppuccin/nvim",
  name = "catppuccin",
  branch = "main", -- force the latest development version
  lazy = false,
  config = function()
    vim.g.catppuccin_flavour = "macchiato"
    require("catppuccin").setup({
      transparent_background = true,
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
        cmp = true,
        telescope = true,
        nvimtree = true,
        which_key = true,
        harpoon = true,
        notify = true,
        dashboard = true,
        markdown = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
},
}
