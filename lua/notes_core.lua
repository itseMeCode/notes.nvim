local lfs = require"lfs"

local M = {}
local opts = {}

local function mkdir(path)
  if not lfs.attributes(path, "mode") then
    lfs.mkdir(path)
  end
end

local function touch(file)
  if not lfs.attributes(file, "mode") then
    local f = io.open(file, "w")
    if f then
      f:write("# Index\n\nWelcome to your notes!")
      f:close()
    else
      print'Could not open main_location'
    end
  end
end

function M.open_inded()
  local index_file = opts.main.location .. "/index.md"
  vim.api.nvim_command("edit " .. index_file)
end

function M.initialize_wiki(user_opts)
  opts = user_opts
  local main_location = opts.main_location
  local diary_location = main_location .. "/Diary"
  local index_file = main_location .. "/index.md"

  mkdir(main_location)

  mkdir(diary_location)

  touch(index_file)
end

return {
  initialize_wiki = M.initialize_wiki,
  NotesIndexOpen = M.open_index
}
