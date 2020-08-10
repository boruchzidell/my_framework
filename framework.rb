# framework.rb

class Framework
  def erb(filename, local={})
    b = binding
    message = local[:message]
    content = File.read("views/#{filename}.erb")
    ERB.new(content).result(b)
  end
  
  def response(status_code, header_hash, body = '')
    body = yield if block_given?
    [
      status_code,
      header_hash,
      [ body ]
    ]
  end
end
