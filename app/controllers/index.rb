
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
    1.times do
      p ENV['AWS_ACCESS_KEY_ID']
      all_res = Amazon::Ecs.item_search("#{item.name}", :item_page => 1, :search_index => 'All')
      @top_res = all_res.items.first
    end
    @items.each do |item_name|
      @res["#{item_name.name}"] = @top_res
    end
  end

    p @res
  erb :profile
end
