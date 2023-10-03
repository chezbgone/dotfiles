return {
  config =
    function ()
      local starter = require('mini.starter')
      starter.setup({
        items = {
          starter.sections.recent_files(10, false, false),
          starter.sections.builtin_actions(),
        },
      })
    end
}
