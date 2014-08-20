require 'httparty'

get '/' do
  p ENV['AWS_ACCESS_KEY_ID']
  @res = Amazon::Ecs.item_search('ruby', :search_index => 'All')
  erb :index
end
