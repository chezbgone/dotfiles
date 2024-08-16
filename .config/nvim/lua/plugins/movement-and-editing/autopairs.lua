return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",

  opts = {
    check_ts = true,
    enable_check_bracket_line = true,
  },

  config = function (_, opts)
    local npairs = require('nvim-autopairs')
    npairs.setup(opts)

    local Rule = require('nvim-autopairs.rule')
    npairs.add_rules({
      Rule("\\(", "\\)", "tex"),
      Rule("\\[", "\\]", "tex"),
      Rule("`", "'", "tex"),
    })
  end,
}
