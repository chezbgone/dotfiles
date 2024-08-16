      local pickers = require('telescope.pickers')
return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },

  opts = function ()
    return {
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
    }
  end,

  config = function (_, opts)
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local conf = require('telescope.config').values

    require('telescope').setup(opts)

    local map_opts = { silent = true }
    vim.keymap.set('n', '<C-p>f', function() require('telescope.builtin').find_files({}) end, map_opts)
    vim.keymap.set('n', '<C-p>g', function() require('telescope.builtin').live_grep({}) end, map_opts)

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
    vim.keymap.set('n', '<C-p>d', function() Dir_picker(false) end, map_opts)
    vim.keymap.set('n', '<C-p>D', function() Dir_picker(true) end, map_opts)
  end,
}
