return {
  tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} },
  config =
    function ()
      local pickers = require('telescope.pickers')
      local finders = require('telescope.finders')
      local conf = require('telescope.config').values

      require('telescope').setup({
        defaults = vim.tbl_extend(
          "force",
          require("telescope.themes").get_ivy(),
          {
            preview = false,
          }
        ),
        pickers = {
          find_files = {
            find_command = {
              "rg",
              "--files",
              "--color", "never",
              "--glob", "!**/.git/*",
            },
            hidden = true,
            mappings = {
              n = {
                ["cd"] = function(prompt_bufnr)
                  local selection = require("telescope.actions.state").get_selected_entry()
                  local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                  require("telescope.actions").close(prompt_bufnr)
                  -- Can also be `cd`, `lcd`, or `tcd`
                  vim.cmd(string.format("silent cd %s", dir))
                end
              },
            },
          },
        },
      })

      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', '<C-p>f', ':lua require("telescope.builtin").find_files({})<CR>', opts)
      vim.api.nvim_set_keymap('n', '<C-p>g', ':lua require("telescope.builtin").live_grep({})<CR>', opts)

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniStarterOpened',
        callback = function() vim.api.nvim_buf_del_keymap(0, 'n', '<C-p>') end
      })

      Dir_picker = function(from_home)
        local command = {
          'fd',
          '--hidden',
          '--absolute-path',
          '--type', 'directory',
        }
        local picker_opts = {}
        if from_home then
          picker_opts.cwd = "~"
        end
        pickers.new(picker_opts, {
          prompt_title = "Change directory",
          finder = finders.new_oneshot_job(command, picker_opts),
          sorter = conf.file_sorter(picker_opts),
        }):find()
      end
      vim.api.nvim_set_keymap('n', '<C-p>d', ':lua Dir_picker(false)<CR>', opts)
      vim.api.nvim_set_keymap('n', '<C-p>D', ':lua Dir_picker(true)<CR>', opts)
    end
}
