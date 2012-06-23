require_relative "blog/version"
require_relative "sort"
require "sinatra"
require "erb"

module Blog
  get '/' do
    erb :index, :locals => {:content => "weekly"}
  end
  
  get '/beta' do
    erb :indexbeta
  end
  
  get '/time' do
    thetime = "Time.now: " + Time.now.to_s
    erb :time, :locals => {:thetime => thetime}
  end
  
  get '/jwrite' do
    erb :indexj2
  end
  
  get '/jennifer' do
    erb :indexj
  end
  
  get '/jennifer/edit' do
    latest_file_content = File.open("lib/views/jenny/latest.erb", "r") { |f| f.read } # works on Heroku
    milestones_file_content = File.open("lib/views/jenny/milestones.erb", "r") { |f| f.read } # works on Heroku
    #latest_file_content = File.open("views/jenny/latest.erb", "r") { |f| f.read } # works locally
    #milestones_file_content = File.open("views/jenny/milestones.erb", "r") { |f| f.read } # locally
    #filecontent = File.open("lib/#{code}.rb", "r") { |f| f.read } # works locally
    erb "/jenny/editmain".to_sym, :locals => {:latest_file_content => latest_file_content, :milestones_file_content => milestones_file_content}
  end
  
  post '/jennifer/edit' do
    @post = params[:post]
    latest_new = @post[:latest_new]
    milestones_new = @post[:milestones_new]
    File.open("lib/views/jenny/latest.erb", 'w') {|f| f.write(latest_new) } # works on Heroku
    File.open("lib/views/jenny/milestones.erb", 'w') {|f| f.write(milestones_new) } # works on Heroku
    #File.open("views/jenny/latest.erb", 'w') {|f| f.write(latest_new) } # works locally
    #File.open("views/jenny/milestones.erb", 'w') {|f| f.write(milestones_new) } # works locally
    "#{latest_new} #{milestones_new}"
    #redirect '/jennifer'
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
    selectionsort = Sort::SelectionSort.new
    selection_sorted = "#{selectionsort.do_sort(numbers_in.split(',').map(&:to_i))}"
    insertionsort = Sort::InsertionSort.new
    insertion_sorted = "#{insertionsort.do_sort(numbers_in.split(',').map(&:to_i))}"
    brettcountsort = Sort::BrettCountSort.new
    brett_count_sorted = "#{brettcountsort.do_sort(numbers_in.split(',').map(&:to_i))}"
    
    erb :sorts, :locals => {:numbers_in => numbers_in, :bubble_sorted => bubble_sorted, :brett_sorted => brett_sorted, :selection_sorted => selection_sorted, :insertion_sorted => insertion_sorted, :brett_count_sorted => brett_count_sorted}
  end
  
  get '/showcode/:code' do |code|
    filecontent = File.open("lib/#{code}.rb", "r") { |f| f.read } # works on Heroku
    #filecontent = File.open("lib/#{code}.rb", "r") { |f| f.read } # works locally
    erb :showcode, :locals => {:filecontent => filecontent, :code => code}
  end  
  
  get '/practices/:practicetype' do |pt|
    #pt = ":'practices/" + pt + "'"
    pt = 'practices/' + pt
    erb :index, :locals => {:content => pt}
  end
  
  get '/environment/:machine' do |m|
    #pt = ":'practices/" + pt + "'"
    m = 'environment/' + m
    erb :index, :locals => {:content => m}
  end
  
  get '/notes' do 
    erb :index, :locals => {:content => "notes"}
  end  
  get '/guano' do 
    erb :index, :locals => {:content => "guano"}
  end
end
