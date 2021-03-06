
get '/' do
  @crafts = crafts
  @crafts_array = @crafts.to_a
  p @crafts_array
  erb :home
end


get '/home' do
  @crafts = crafts
  @crafts_array = @crafts.to_a
  erb :home
end

get '/craft/:id' do
  @craft = crafts.find_by_id(params[:id])
  @items = @craft.items

  @res = {}

  @items.each do |item|
    ENV['AWS_ACCESS_KEY_ID']
    all_res = Amazon::Ecs.item_search("#{item.name}", :search_index => 'All')
    @top_res = all_res.items.first
    # Client.new.request
    @res["#{item.name}"] = @top_res
  end
  # p @res

  erb :profile
end
