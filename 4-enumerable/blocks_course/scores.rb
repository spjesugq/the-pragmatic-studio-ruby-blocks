scores = [83, 71, 92, 64, 98, 87, 75, 69]

puts "High scores:"
high_scores = scores.select do |score|
  score > 80
end
p high_scores

puts "Low scores:"
low_scores = scores.reject do |score|
  score > 80
end
p low_scores

puts "Failing scores: #{scores.any? { |score| score < 70 }}"
puts scores.detect { |score| score < 70 }

puts "All scores:"
p scores
