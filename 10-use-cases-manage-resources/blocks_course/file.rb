file = File.open("letter.txt", "w")
file.puts "Hello!"
file.puts "Goodbye."
file.close

file = File.open("letter.txt", "r")
file.each { |line| puts line }
file.close

File.open("letter.txt", "w") do |file|
  file.puts "Hello!"
  file.puts "Goodbye."
end

File.open("letter.txt", "r") do |file|
  file.each { |line| puts line }
end

class File
  def self.my_open(filename, mode)
    file = File.new(filename, mode)

    return file unless block_given?

    begin
      yield file
    ensure
      file.close
    end
  end
end

File.my_open("letter.txt", "w") do |file|
  file.puts "Hello!"
  file.puts "Goodbye."
end

File.my_open("letter.txt", "r") do |file|
  file.each { |line| puts line }
end
