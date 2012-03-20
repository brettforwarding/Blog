require_relative "blog/version"
require "sinatra"
require "erb"

module blog
  get '/' do
    erb :index
  end
end
