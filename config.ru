# config.ru
require_relative 'hello_world'
require 'pry'

# require 'pry'; binding.pry
run HelloWorld.new
# require 'pry'; binding.pry