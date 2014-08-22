
require_relative '../config/environment'
require 'faker'

##image links

@images = ["http://i.imgur.com/EaNmbVG.jpg?1", "http://i.imgur.com/HGzWgjj.jpg?4883", "http://i.imgur.com/pdEal7q.jpg", "http://i.imgur.com/LtDyYKS.jpg", "http://i.imgur.com/umSuskL.jpg", "http://i.imgur.com/EZZmWHB.jpg", "http://i.imgur.com/NHYBHpL.jpg", "http://i.imgur.com/hMzWUTv.jpg", "http://i.imgur.com/jScJ09K.jpg", "http://i.imgur.com/pcw2EKe.jpg", "http://i.imgur.com/ODypwpx.jpg", "http://i.imgur.com/1Fb0U02.jpg", "http://i.imgur.com/Oeig4I4.jpg", "http://i.imgur.com/kgCQ0uD.jpg"]


##item names

@search_items = ["glitter", "puppies", "hats", "ribbon", "cups", "candy"]

##create sample themes
4.times do
  Theme.create(name: Faker::Commerce.product_name)
end

@themes = Theme.all
##create sample craft objects
14.times do |cycle|
  Craft.create(name: Faker::Commerce.product_name,
              description: Faker::Company.catch_phrase,
              source_url: Faker::Internet.url('example.com'),
              image_url: @images[cycle],
              theme_id: @themes.sample.id)
end

##create 5 items for each craft
crafts =  Craft.all
crafts.each_with_index do |craft, index|
  @craft_id = index + 1
  5.times do
    Item.create(craft_id: @craft_id, name: @search_items.sample)
  end
end