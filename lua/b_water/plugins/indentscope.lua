return {
  {
    "echasnovski/mini.indentscope",
    version = false,
    config = function()
      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true },
        -- default textobjects/motions:
        --  ii  -> inner scope,  ai -> around scope
        --  [i  -> goto scope top, ]i -> goto scope bottom
      })
    end,
  },
}
