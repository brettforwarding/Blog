$:.push File.expand_path("../lib", __FILE__)
require 'simpleheroku.rb'

run Sinatra::Application
