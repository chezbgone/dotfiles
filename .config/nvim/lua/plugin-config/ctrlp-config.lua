return {
  config =
    function ()
      vim.g.ctrlp_custom_ignore = { dir = 'node_modules' }
      vim.g.ctrlp_root_markers = {'.ctrlp-root'}
    end,
}
