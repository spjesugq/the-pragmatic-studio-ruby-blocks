# start_Time = Time.now

# sleep(0.5)

# elapsed_time = Time.now - start_time
# puts "It took #{elapsed_time} seconds"

# def time_it
#   start_time = Time.now
#   yield
#   elapsed_time = Time.now - start_time
#   puts "It took #{elapsed_time} seconds"
# end

# time_it do
#   sleep(0.5)
# end

def time_it(label)
  start_time = Time.now
  yield
  elapsed_time = Time.now - start_time
  puts "#{label} took #{elapsed_time} seconds"
end

time_it("Sleepy code") do
  sleep(0.5)
end

require 'benchmark'

elapsed_time = Benchmark.realtime do
  sleep(1)
end

puts "It took #{elapsed_time}"

def time_it(name)
  elapsed_time = Benchmark.realtime do
    yield
  end
  puts "#{name} took #{elapsed_time}"
end

time_it("Sleepy code") do
  sleep(1)
end
