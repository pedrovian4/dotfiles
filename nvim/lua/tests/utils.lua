local function assert_equal(actual, expected, description)
  if actual ~= expected then
    error(description .. "\nExpected: " .. tostring(expected) .. "\nGot: " .. tostring(actual))
  end
  print("[PASS] " .. description)
end

local function assert_error(fn, expected_message, description)
  local status, err = pcall(fn)
  if status or not err:match(expected_message) then
    error(description .. "\nExpected error: " .. tostring(expected_message) .. "\nGot: " .. tostring(err))
  end
  print("[PASS] " .. description)
end

return {
  assert_equal = assert_equal,
  assert_error = assert_error,
}
