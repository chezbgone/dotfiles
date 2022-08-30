return {
  setup =
    function ()
      vim.g.vimwiki_folding = 'custom'
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_list = {
        {
          path = '~/Dropbox/vimwiki/',
          path_html = '~/Dropbox/vimwiki/site/',
          name = 'Journal',
          auto_export = 1,
          auto_toc = 1,
          index = 'main',
          links_space_char = '_',
          diary_rel_path = 'journal/',
          diary_index = 'journal',
          diary_header = 'Journal',
        },
      }
    end
}
