local M = {}  -- Module table

-- Function to create a directory if it doesn't exist
local function mkdir(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
  end
end

-- Function to create a file if it doesn't exist
local function touch(file)
  if vim.fn.filereadable(file) == 0 then
    local f = io.open(file, "w")
    f:write("# Index\n\nWelcome to your notes!")
    f:close()
  end
end

-- Main initialization function
function M.initialize_wiki(opts)
  local main_location = opts.main_location
  local diary_location = main_location .. "/Diary"
  local index_file = main_location .. "/index.md"

  -- Create main_location directory if it doesn't exist
  mkdir(main_location)

  -- Create Diary directory if it doesn't exist
  mkdir(diary_location)

  -- Create index.md if it doesn't exist
  touch(index_file)
end

return M
