require 'rubygems'
require 'rack'
require 'lib/handler'
require 'rack/contrib'

SECRET = "redrum"
UPLOAD_DIR = "files/"

use Uploadd::Handler
run Rack::NotFound.new('404.txt')



