require "sinatra"
require "erb"

module blog
  get '/' do
    erb :index
  end
end
