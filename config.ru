require 'rack'
require 'rack/contrib/static_cache'
require 'rack/contrib/try_static'

module Rack
  class TryStatic
    def initialize(app, options)
      @app    = app
      @try    = ["", *options.delete(:try)]
      @static = ::Rack::Static.new(
        lambda { [404, {}, []] },
        options)
    end

    def call(env)
      orig_path = env["PATH_INFO"]
      found     = nil
      @try.each do |path|
        resp = @static.call(env.merge!({"PATH_INFO" => orig_path + path}))
        break if 404 != resp[0] && found = resp
      end
      found or @app.call
    end
  end
end

use Rack::TryStatic,
  :root => 'build',
  :urls => ['/'],
  :try  => ['.html', 'index.html', '/index.html']

use Rack::StaticCache, urls: ['/'], root: 'build'
run lambda { [404, {"Content-Type" => "text/plain"}, ["File not found!"]] }