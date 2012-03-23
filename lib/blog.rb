require_relative "blog/version"
require_relative "sort"
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
  
  get '/jennifer' do
    erb :indexj
  end
  
  get '/sorts' do
    erb :sorts, :locals => {:numbers_in => nil}
  end
  
  post '/sorts' do
    @post = params[:post]
    numbers_in = @post[:numbers_in]
    bubsort = Sort::BubbleSort.new
    bubble_sorted = "#{bubsort.do_sort(numbers_in.split(',').map(&:to_i))}"
    brettsort = Sort::BrettSort.new
    brett_sorted = "#{brettsort.do_sort(numbers_in.split(',').map(&:to_i))}"
    erb :sorts, :locals => {:numbers_in => numbers_in, :bubble_sorted => bubble_sorted, :brett_sorted => brett_sorted}
  end
  
  get '/showcode/:code' do |code|
    filecontent = File.open("#{code}.rb", "r") { |f| f.read }
    # filecontent = File.read("#{code}.rb")
    erb :showcode, :locals => {:filecontent => filecontent, :code => code}
  end
end
