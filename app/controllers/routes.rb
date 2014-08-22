
get '/' do
  @crafts = crafts
  @crafts_array = @crafts.to_a
  p @crafts
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
    Amazon::Client.new.request
    @res["#{item.name}"] = @top_res
  end
  erb :profile
end
