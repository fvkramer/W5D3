require 'rack'

class MyController
  def initialize(req, res)
    @req = req
    @res = res
  end

  def execute
    if @req.path == '/i/love/app/academy'
      @res.write('/i/love/app/academy')
    else
      @res.write("Hello World!")
    end
  end
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  MyController.new(req, res).execute
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
