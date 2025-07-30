# magic_number = (23 - Time.now.hour) * Math::PI

# puts "Got Here!"

# magic_number = (23 - Time.now.hour) * Math::PI

# puts "Result was #{result}"

def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end

def with_expectation(expected)
  puts "Running test..."
  actual = yield
  puts expected == actual ? "Passed." : "Failed.\nExpected #{expected}, but got #{actual}."
end

with_expectation(4) { 2 + 2 }
with_expectation(5) { 2 + 2 }
