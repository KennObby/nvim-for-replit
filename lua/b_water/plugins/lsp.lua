return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
            local _ = require("lspconfig")
            require("mason").setup()

            local servers = { "lua_ls", "pyright", "zls", "ruff_lsp" }
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_installation = true,
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            
            -- Define per-server configs
            vim.lsp.config["lua_ls"] = {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            }
            vim.lsp.config["ruff_lsp"]  = { capabilities = capabilities }
            vim.lsp.config["pyright"] = { capabilities = capabilities }
            vim.lsp.config["zls"] = { capabilities = capabilities }

            -- Enable them (they’ll start on matching filetypes/roots)
            for _, s in ipairs(servers) do 
                vim.lsp.enable(s)
            end
            
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = true,
                severity_sort = true,
            })
        end,
    },
}
