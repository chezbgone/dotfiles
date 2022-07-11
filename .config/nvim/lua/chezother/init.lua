local npairs = require("nvim-autopairs")

-- use treesitter to prevent autopairs sometimes
npairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},-- it will not add a pair on that treesitter node
    javascript = {'template_string'},
    java = false,-- don't check treesitter on java
  }
})

-- press % => %% only while inside a comment or string
local ts_conds = require('nvim-autopairs.ts-conds')
local Rule = require('nvim-autopairs.rule')
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})

npairs.add_rules({
  Rule("\\(", "\\)", "tex"),
  Rule("\\[", "\\]", "tex"),
  Rule("`", "'", "tex"),
})

-- Don't add pairs if it already has a close pair in the same line
-- require('nvim-autopairs').setup({
--   enable_check_bracket_line = false
-- })
