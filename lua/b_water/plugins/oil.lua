return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
    opts = {
      -- keep NvimTree as-is; set to true if you want Oil to replace it/netrw
      default_file_explorer = false,
      columns = { "icon" },           -- simple, readable
      view_options = { show_hidden = true }, -- see dotfiles
      skip_confirm_for_simple_edits = true,  -- smoother renames/moves
    },
    cmd = "Oil",
  },
}
