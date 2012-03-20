require_relative "blog/version"
require "sinatra"
require "erb"

module Blog
  get '/' do
    erb :index
  end
  
  get '/beta' do
    erb :indexbeta
  end
  
  get '/time' do
    thetime = "Time.now: " + Time.now.to_s
    erb :time, :locals => {:thetime => thetime}
  end
end
