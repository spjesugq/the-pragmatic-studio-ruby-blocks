class Order
  TAX_TABLE = { CO: 0.02, MT: 0.00, AZ: 0.04 }

  attr_reader :email, :total, :state, :status

  def initialize(email, state, total, status=:pending)
    @email = email
    @state = state
    @total = total
    @status = status
  end

  def tax
    total * TAX_TABLE[state.to_sym]
  end

  def to_s
    "#{email} (#{state}): $#{total} – #{status}"
  end
end

orders = []
orders << Order.new("customer1@example.com", "MT", 300)
orders << Order.new("customer2@example.com", "AZ", 400, :completed)
orders << Order.new("customer3@example.com", "CO", 200)
orders << Order.new("customer4@example.com", "CO", 100, :completed)
puts orders

# big_orders = orders.select do |order|
#   puts "#{order} – #{order.total >= 300}"
# end
# puts big_orders

# puts orders.select { |order| order.total >= 300 }

# puts orders.select do
#   |order| order.total >= 300
# end

# puts(orders.select) do
#   |order| order.total >= 300
# end

puts "Big orders:"
big_orders = orders.select do |order|
  order.total >= 300
end
puts big_orders

puts "Small orders:"
small_orders = orders.reject do |order|
  order.total > 300
end
puts small_orders

puts "Pending orders: #{orders.any? { |order| order.status == :pending }}"
puts orders.detect { |order| order.status == :pending }

pending_orders, completed_orders = orders.partition { |order| order.status == :pending }
puts "Pending orders:"
puts pending_orders
puts "Completed orders:"
puts completed_orders

big_orders, small_orders = orders.partition { |order| order.total >= 300 }
puts "Big orders:"
puts big_orders
puts "Small orders:"
puts small_orders

puts "Newsletter emails:"

# emails = []
# orders.each do |order|
#   emails << order.email.lowcase
# end
# puts emails

emails = orders.map { |order| order.email.downcase }
puts emails

puts "CO Taxes:"

# co_orders = orders.select { |order| order.state == "CO" }
# co_taxes = co_orders.map { |order| order.tax }
# p co_taxes

co_taxes = orders.select { |order| order.state == "CO" }.map { |order| order.tax }
p co_taxes

# sum = 0
# orders.each { |order| sum += order.total }
# puts "Total sales: $#{sum}"

sum = orders.reduce(0) { |sum, order| sum + order.total }
puts "Total sales: $#{sum}"

# total_tax = orders.reduce(0) { |total, order| total + order.tax }
# puts "Total tax: $#{total_tax}"

total_tax = orders.map { |order| order.tax }.reduce(:+)
puts "Total tax: $#{total_tax}"
