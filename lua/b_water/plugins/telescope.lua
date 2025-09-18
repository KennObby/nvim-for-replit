return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      telescope.setup({})
      telescope.load_extension("file_browser")

      local function active_lsp()
        return next(vim.lsp.get_active_clients({ bufnr = 0 })) ~= nil
      end

      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files({ cwd = "~" })
      end)
      vim.keymap.set('n', '<leader>lg', builtin.live_grep)
      vim.keymap.set('n', '<leader>fb', builtin.buffers)
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
      vim.keymap.set('n', '<leader>fh', builtin.help_tags)
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)

      vim.keymap.set('n', '<leader>fd', function()
        builtin.find_files({
          prompt_title = "< Dotfiles >",
          cwd = "~/.config/nvim",
          hidden = true,
        })
      end)

      vim.keymap.set('n', '<leader>fb', ":Telescope file_browser<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fB', function()
        telescope.extensions.file_browser.file_browser({
          path = "~/.config/nvim",
          hidden = true,
          respect_gitignore = false
        })
      end)

      vim.keymap.set('n', 'gd', function()
        if active_lsp() then builtin.lsp_definitions()
        else vim.notify("No LSP client attached", vim.log.levels.WARN) end
      end)

      vim.keymap.set('n', 'gr', function()
        if active_lsp() then builtin.lsp_references()
        else vim.notify("No LSP client attached", vim.log.levels.WARN) end
      end)

      vim.keymap.set('n', '<leader>ds', function()
        if active_lsp() then builtin.lsp_document_symbols()
        else vim.notify("No LSP client attached", vim.log.levels.WARN) end
      end)

      vim.keymap.set('n', '<leader>ws', function()
        if active_lsp() then builtin.lsp_workspace_symbols()
        else vim.notify("No LSP client attached", vim.log.levels.WARN) end
      end)
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
