class Integer
  def n_times
    i = 0
    while i < self
      yield i
      i += 1
    end
  end
end

10.n_times { |number| puts "#{number} Echo!" }
10.times { |number| puts "#{number} Echo!" }
