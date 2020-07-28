#! /usr/bin/env ruby

require_relative 'advice'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      template = File.read('views/index.erb')
      response = ERB.new(template)
      [
        '200', 
        {'Content-Type' => 'text/html'}, 
        [response.result]
      ]
    when '/advice'
      [
        '200', 
        {'Content-Type' => 'text/html'}, 
        ["<html><body><b><em>#{Advice.new.generate}</em></b></body></html>"]
      ]
    else
      [
        '404',
        {'Content-Type' => 'text/html', 'Content-Length' => '48'},
        ['<html><body><h4>404 Not Found</h4></body></html>']
      ]
    end
  end
end