def three_times
  yield
  yield
  yield
end

three_times { puts "Ho!" }

puts ""

def three_times
  1.upto(3) do |count|
    yield count
  end
end

three_times do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end

puts ""

def n_times(count)
  1.upto(count) { |count| yield count }
end

n_times(5) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end

puts ""

def progress
  0.step(100, 10) do |number|
    yield number
  end
end

progress { |percent| puts percent }

puts ""

def greet
  yield "Larry", 18
end

greet { |name, age| puts "Hello, #{name}. You don't look #{age}!" }

def greet
  yield
end
  
greet { |name, age| puts "Hello, #{name}. You don't look #{age}!" }
