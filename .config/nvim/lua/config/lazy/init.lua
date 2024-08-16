local lazy_utils = require('config.lazy.utils')

lazy_utils.bootstrap()

require("lazy").setup({
  -- load plugins from nested folders
  spec = lazy_utils.generate_import_specs(),
  checker = { enabled = true },
})
