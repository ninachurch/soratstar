
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
  all_res = Amazon::Ecs.item_search('puppies', :item_page => 1, :search_index => 'All')

  @res = all_res.items[0..3]

  erb :profile
end
