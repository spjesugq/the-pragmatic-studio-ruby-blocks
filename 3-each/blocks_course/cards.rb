cards = ["Jack", "Queen", "King", "Ace", "Joker"]

# cards.each do |card|
#   puts "#{card.upcase} – #{card.length}"
# end

# cards.shuffle.each do |card|
#   puts "#{card.upcase} – #{card.length}"
# end

cards.reverse_each do |card|
  puts "#{card.upcase} – #{card.length}"
end

puts ""

scores = { Larry: 10, Moe: 8, Curly: 12 }

scores.each do |name, score|
  puts "#{name} scored a #{score}!"
end
