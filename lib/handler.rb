require 'rubygems'
require 'rack'
require 'fileutils'

module Uploadd
  class Handler

    def initialize(app)
      @app = app
    end

    def call(env)
      if env["REQUEST_METHOD"] == "PUT" or env["REQUEST_METHOD"] == "POST"
        if env['PATH_INFO'] == '/up'
          request = Rack::Request.new(env)
          if request.params["file"] and request.params["secret"] == SECRET
            uploaded_file = request.params["file"][:tempfile]
            filename = request.params["filename"]
            FileUtils::mkdir_p("#{UPLOAD_DIR/#{File.dirname(filename)}")
            File.open("#{UPLOAD_DIR}/#{filename}", "w") do |f|
              f.puts uploaded_file.read
            end
            [200, {"Content-Type" => "text/plain", "Content-Length" => "2"},['OK']]
          else
            [500, {"Content-Type" => "text/plain", "Content-Length" => "2"},['NO']]
          end
        end
      else
        [404, {"Content-Type" => "text/plain", "Content-Length" => "2"},['NO']]
      end
    end
  end
end
