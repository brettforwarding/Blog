$:.push File.expand_path("../lib", __FILE__)
require 'blog.rb'

run Sinatra::Application
