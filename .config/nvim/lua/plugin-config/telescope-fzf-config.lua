return {
  run = 'make',
  config = function ()
    require('telescope').load_extension('fzf')
  end
}
