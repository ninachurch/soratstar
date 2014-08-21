
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
  @items = @craft.items

  @res = {}

  @items.each do |item|
    p ENV['AWS_ACCESS_KEY_ID']
    all_res = Amazon::Ecs.item_search("#{item.name}", :item_page => 1, :search_index => 'All')
    @top_res = all_res.items.first
    @res["#{item.name}"] = @top_res

  end

    p @res
  erb :profile
end
