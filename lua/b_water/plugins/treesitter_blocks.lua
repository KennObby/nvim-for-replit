return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua","python","c","cpp","bash","markdown","json","yaml","toml","vim","vimdoc","query"
        },
        highlight = { enable = true },
        indent    = { enable = true },

        -- Incremental selection = grow/shrink “by syntax node”
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = "gnn", -- start selection
            node_incremental  = "grn", -- grow to next node
            scope_incremental = "grc", -- grow to scope
            node_decremental  = "grm", -- shrink
          },
        },

        -- Textobjects: select / move / swap “blocks”
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- like targets.vim
            keymaps = {
              ["af"] = "@function.outer",  ["if"] = "@function.inner",
              ["ac"] = "@class.outer",     ["ic"] = "@class.inner",
              ["ab"] = "@block.outer",     ["ib"] = "@block.inner",
              ["ap"] = "@parameter.outer", ["ip"] = "@parameter.inner",
              ["aC"] = "@comment.outer",
            },
          },
          move = {
            enable = true, set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]b"] = "@block.outer",
              ["]p"] = "@parameter.inner",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[b"] = "@block.outer",
              ["[p"] = "@parameter.inner",
            },
          },
          swap = {
            enable = true,
            swap_next     = { [">p"] = "@parameter.inner" }, -- swap with next param
            swap_previous = { ["<p"] = "@parameter.inner" }, -- swap with prev param
          },
        },
      })
    end,
  },
}

