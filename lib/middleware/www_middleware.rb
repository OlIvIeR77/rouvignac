#http://blog.dynamic50.com/2011/02/22/redirect-all-requests-for-www-to-root-domain-with-heroku/
class WwwMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.host.starts_with?(“*.fr”)
      [301, {"Location" => request.url.sub("//*.fr", "//www.*.fr")}, self]
    else
      @app.call(env)
    end
  end

  def each(&block)
  end
end
