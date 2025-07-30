# spec = Gem::Specification.new do |s|
#   s.name        = 'my-gem'
#   s.version     = '2.0.0'
#   s.summary     = 'This is a cool gem!'
#   s.description = 'Much longer explanation of my cool gem.'
#   s.licenses    = ['MIT']
#   s.authors     = ['Ruby Coder']
#   s.email       = 'rubycoder@example.rb'
#   s.files       = ['lib/example.rb']
#   s.homepage    = 'https://rubygems.org/gems/example'
# end
# puts spec

module Jem
  class Specification
    attr_accessor :name, :version, :summary

    def initialize
      @version = '1.0.0'
      yield(self) if block_given?
    end
  end
end

spec = Jem::Specification.new do |s|
  s.name        = 'my-gem'
  s.version     = '2.0.0'
  s.summary     = 'This is a cool gem!'
end
puts spec

spec = Jem::Specification.new
spec.name = "Mike"
puts spec
