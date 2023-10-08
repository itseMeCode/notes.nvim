local notes_core = require'.notes_core'

local default_opts = {main_location = vim.fn.expand('$HOME/notes')}
notes_core.initialize_wiki(default_opts)

local function setup(opts)
  opts = opts or {}
  opts = vim.tbl_extend('force', default_opts, opts)
  notes_core.initialize_wiki(opts)

end

return {
  setup = setup
}
