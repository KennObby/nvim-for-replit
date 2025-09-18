return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        config = {
          shortcut = {
            { desc = "Find files", group = "File", key = "<leader>ff", action = "Telescope find_files" },
            { desc = "Recent files", group = "File", key = "<leader>fr", action = "Telescope oldfiles" },
            { desc = "File Browser", group = "File", key = "<leader>fb", action = "NERDTreeToggle" },
            { desc = "Grep Projects", group = "Search", key = "<leader>fg", action = "Telescope find_files" },
            { desc = "Rename Symbol", group = "Code", key = "<leader>rn", action = "lua vim.lsp.buf.rename()" },
            { desc = "Go To Definition", group = "Code", key = "<leader>gd", action = "lua vim.lsp.buf.definition()" },
            { desc = "Horizontal split", group = "Window", key = "<leader>sh", action = "split" },
            { desc = "Vertical split", group = "Window", key = "<leader>sv", action = "vsplit" },
            { desc = "Close window", group = "Window", key = "<leader>q", action = "close" },
            { desc = "Next buffer", group = "Buffer", key = "<leader>bn", action = "bnext" },
            { desc = "Previous buffer", group = "Buffer", key = "<leader>bp", action = "bprev" },
            { desc = "Close buffer", group = "Buffer", key = "<leader>bc", action = "bdelete" },
            { desc = "Git Status", group = "Git", key = "<leader>gs", action = "Git" },
            { desc = "Git Diff", group = "Git", key = "<leader>gd", action = "Gdiffsplit" },
            { desc = "Git Commit", group = "Git", key = "<leader>gc", action = "Git Commit" },
            { desc = "Toggle Comment", group = "Utility", key = "<leader>c", action = "Commentary" },
            { desc = "Git Commit", group = "Utility", key = "<leader>w", action = "write" },
            { desc = "Git Commit", group = "Utility", key = "<leader>gc", action = "qa" },
            { desc = "Harpoon Menu", group = "Harpoon", key = "<leader>hm", action = "lua require('harpoon.ui').toggle_quick_menu()" },
            { desc = "Add File to Harpoon", group = "Harpoon", key = "<leader>ha", action = "lua require('harpoon.mark').add_file()" },
          },
          packages = { enable = true },
          project = {
            enable = true,
            limit = 8,
            icon = '📂',
            label = '',
            action = function(path)
              vim.cmd('cd ' .. path)
              vim.cmd('NvimTreeOpen')
            end,
          },
          mru = { limit = 10, icon = '🗂️', label = 'Recent Files', cwd_only = false },
          footer = {},
        }
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  }
}
