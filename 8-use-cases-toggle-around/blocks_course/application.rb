class Application
  attr_accessor :environment

  def initialize
    @environment = :development
  end

  def connect_to_database
    puts "Connecting to #{@environment} database..."
  end

  def handle_request
    puts "Handling #{@environment} request..."
  end

  def write_to_log
    puts "Writing to #{@environment} log file..."
  end

  def in_environment(new_environment)
    old_environment = @environment
    @environment = new_environment
    yield
  rescue Exception => exception
    puts exception.message
  ensure
    @environment = old_environment
    puts "Reset environment to #{@environment}"
  end
end

app = Application.new

app.in_environment(:production) do
  app.connect_to_database
  app.handle_request
  app.write_to_log
end

puts ""

app.in_environment(:test) do
  app.connect_to_database
  app.handle_request
  app.write_to_log
end

# Rails only
# def with_locale(new_locale)
#   old_locale = I18n.locale
#   I18n.locale = new_locale
#   yield
# ensure
#   I18n.locale = old_locale
# end

# def travel_to(date_or_time)
#   if date_or_time.is_a?(Date) && !date_or_time.is_a?(DateTime)
#     now = date_or_time.midnight.to_time
#   else
#     now = date_or_time.to_time.change(usec: 0)
#   end

#   simple_stubs.stub_object(Time, :now, now)
#   simple_stubs.stub_object(Date, :today, now.to_date)
#   simple_stubs.stub_object(DateTime, :now, now.to_datetime)

#   if block_given?
#     begin
#       yield
#     ensure
#       travel_back
#     end
#   end
# end
