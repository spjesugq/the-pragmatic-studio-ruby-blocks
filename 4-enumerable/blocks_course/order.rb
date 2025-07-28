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
    total * TAX_TABLE[state]
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
