return {
  ft = {'agda', 'agda.markdown'},
  requires = {
    {'neovimhaskell/nvim-hs.vim'},
    {'liuchengxu/vim-which-key'}
  },
  config =
    function ()
      vim.g.cornelis_split_direction = 'Vertical'
      vim.cmd[[
        call cornelis#bind_input("forall", "∀")
        call cornelis#bind_input("exists", "∃")
        call cornelis#bind_input("Pi", "Π")
        call cornelis#bind_input("Sigma", "Σ")
        call cornelis#bind_input("leq", "≤")
        call cornelis#bind_input("geq", "≥")
        call cornelis#bind_input("equiv", "≡")
        call cornelis#bind_input("lambda", "λ")
        call cornelis#bind_input("star", "★")
      ]]
    end
}
