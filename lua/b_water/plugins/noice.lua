return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    config = function()
      require("noice").setup({
        lsp = {
          progress = { enabled = true },
          signature = { enabled = true },
        },
        presets = {
          command_palette = true,
          lsp_doc_border = true,
        },
      })
    end
  }
}
