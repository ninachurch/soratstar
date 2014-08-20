require 'httparty'

get '/' do
  p ENV['AWS_ACCESS_KEY_ID']
  @res = Amazon::Ecs.item_search('glitter', :search_index => 'All')
  erb :index
end

get '/home' do

end