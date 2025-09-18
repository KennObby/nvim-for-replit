return {
  {
    "junegunn/fzf.vim",
    run = function()
      vim.fn["fzf#install"]()
    end
  }
}
