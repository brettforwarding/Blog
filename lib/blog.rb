require_relative "blog/version"
require "sinatra"
require "erb"

module Blog
  get '/' do
    erb :index
  end
end
