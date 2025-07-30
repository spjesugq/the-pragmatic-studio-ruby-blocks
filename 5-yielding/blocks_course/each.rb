class Array
  def n_each
    i = 0
    while i < self.size
      yield self[i]
      i += 1
    end
  end
end

weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
weekdays.n_each { |day| puts day }
weekdays.each { |day| puts day }
