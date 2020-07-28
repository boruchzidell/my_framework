#! /usr/bin/env ruby

require 'erb'

template_file = File.read('test.erb')
erb = ERB.new(template_file)
erb.result