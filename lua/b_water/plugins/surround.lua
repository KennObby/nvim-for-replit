return {
  {
    "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup()
      -- keys: sa{motion}{char} add, sd delete, sr replace
      -- ex: sap"  -> surround a paragraph with "
    end,
  },
}

