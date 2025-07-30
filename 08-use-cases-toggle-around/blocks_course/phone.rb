class Phone
  attr_accessor :airplane_mode

  def initialize
    @airplane_mode = false
  end

  def text(message)
    if @airplane_mode
      puts "Saved text: #{message}"
    else
      puts "Sent text: #{message}"
    end
  end

  def in_air_plane_mode
    @airplane_mode = true
    yield
  rescue Exception => exception
    puts exception.message
  ensure
    @airplane_mode = false
    puts "Mode is now #{@airplane_mode}"
  end
end

phone = Phone.new

phone.in_air_plane_mode do
  phone.text("Just took off!")
  phone.text("At 30,000 ft!")
  raise "Whoops!"
end
phone.text("Just landed!")
