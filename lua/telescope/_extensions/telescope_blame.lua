local M = {}

-- Function to get git blame for a file or a specific range
-- This is a simplified example. You will need to handle errors and parse the output.
M.git_blame = function(filepath, start_line, end_line)
  local cmd = "git blame"
  if start_line and end_line then
    cmd = cmd .. string.format(" -L %d,%d", start_line, end_line)
  end
  cmd = cmd .. " -- " .. filepath

  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()

  return result
end

return M
