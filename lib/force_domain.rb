# Code from https://github.com/cwninja/rack-force_domain
# by Tom Lea

require 'rack'

class ForceDomain
  def initialize(app, domain)
    @app = app
    @domain = domain
  end

  def call(env)
    request = Rack::Request.new(env)
    if @domain and request.host != @domain
      fake_request = Rack::Request.new(env.merge("HTTP_HOST" => @domain))
      Rack::Response.new([], 301, "Location" => fake_request.url).finish
    else
      @app.call(env)
    end
  end
end

