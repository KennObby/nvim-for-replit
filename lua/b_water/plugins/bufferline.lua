return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",          -- ensure the integration is available
    },
    config = function()
      -- try to pull Catppuccin’s tuned highlights
      local highlights = {}
      local ok, integ = pcall(require, "catppuccin.groups.integrations.bufferline")
      if ok and type(integ.get) == "function" then
        -- You can pass options here if you like. “transparent” isn’t a style the
        -- integration understands; transparency is handled by the main Catppuccin
        -- setting + your custom_highlights.
        highlights = integ.get()
      end

      require("bufferline").setup({
        highlights = highlights,
        options = {
          diagnostics = "nvim_lsp",
          offsets = {
            { filetype = "NvimTree", text = "Explorer", text_align = "center" },
          },
          show_buffer_close_icons = false,
          show_close_icon = false,
        },
      })
    end,
  },
}
