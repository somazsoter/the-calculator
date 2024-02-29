class AuthMiddleware
  def initialize(app)
    @app = app
  end
  
  def call(env)
    request = Rack::Request.new(env)
    return @app.call(env) if request.path == '/'
  
    auth = Rack::Auth::Basic::Request.new(env)
    return unauthorized unless auth.provided?
    return @app.call(env) if auth.credentials == ['moqo', '1234']
  
    unauthorized
  end
  
  def unauthorized
    Rack::Response.new('UNAUTHORIZED', 401, {}).finish
  end
end
