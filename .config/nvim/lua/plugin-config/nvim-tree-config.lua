return {
  config =
    function ()
      require('nvim-tree').setup({
        view = {
          width = 22,
          preserve_window_proportions = true,
        },
        actions = {
          open_file = {
            window_picker = {
              exclude = {
                filetype = {},
                buftype = {},
              },
            },
          },
        },
        on_attach = function (bufnr)
          local api = require('nvim-tree.api')

          local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          api.config.mappings.default_on_attach(bufnr)

          vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
          vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
        end
      })

      -- automatically close NvimTree if it's the last buffer
      -- https://github.com/nvim-tree/nvim-tree.lua/issues/1368#issuecomment-1512248492
      vim.api.nvim_create_autocmd("QuitPre", {
        callback = function()
          local invalid_win = {}
          local wins = vim.api.nvim_list_wins()
          for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
              table.insert(invalid_win, w)
            end
          end
          if #invalid_win == #wins - 1 then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
          end
        end
      })
    end
}
