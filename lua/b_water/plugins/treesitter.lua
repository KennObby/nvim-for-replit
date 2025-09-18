return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ok, treesitter = pcall(require, "nvim-treesitter.configs")
      if not ok then
        vim.notify("Treesitter not installed!", vim.log.levels.WARN)
        return
      end

      treesitter.setup({
        ensure_installed = {
          "c", "lua", "vim", "bash", "python", "javascript", "typescript",
          "json", "markdown", "markdown_inline", "yaml", "toml", "rust", "go",
          "cpp", "vimdoc"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local disabled_fts = { "markdown", "markdown_inline", "vimdoc", "c", "cpp" }
            if vim.list_contains(disabled_fts, lang) then
              return true
            end
            local max_filesize = 1000 * 1024 -- 1MB
            local filename = vim.api.nvim_buf_get_name(buf)
            local stats = vim.loop.fs_stat(filename)
            if stats and stats.size > max_filesize then
              return true
            end
            return false
          end,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = false
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          }
        }
      })
    end,
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle"
  }
}
