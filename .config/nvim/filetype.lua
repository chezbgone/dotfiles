vim.filetype.add({
  extension = {
    asy = 'asymptote',
  },
  pattern = {
    ['.*%.lagda%.md'] = 'agda.markdown',
  }
})
