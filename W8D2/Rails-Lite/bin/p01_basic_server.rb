require 'rack'

app = Proc.new do |env|

    # req = Rack::Request.new(env) #=> this line is optional in this example
    #because we are not modifying the response based on input
    
    res = Rack::Response.new 
    res.write('Hello World')
    res.finish

end

Rack::Server.start( app: app, Port:4000)
