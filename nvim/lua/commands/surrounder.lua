local M = {}

function M.surrounder(surrounder, surroundee)
  if surrounder:find("%s") then
    error("Surrounder should not contain whitespaces")
  end

  if #surrounder ~= 2 then
    error("Surrounder must be a string of lenght 2")
  end

  local left = surrounder:sub(1, 1)
  local right = surrounder:sub(2, 2)
  return left .. surroundee .. right
end

return M
