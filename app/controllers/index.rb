
get '/' do
  erb :index
end


get '/home' do
  @crafts = crafts
  @crafts_array = @crafts.to_a
  erb :home
end

get '/craft/:id' do
  @craft = crafts.find_by_id(params[:id])

  p ENV['AWS_ACCESS_KEY_ID']
  @res = Amazon::Ecs.item_search('glitter', :search_index => 'All')
  erb :profile
end
