
require_relative '../config/environment'
require 'faker'

##image links

@images = ["http://i.imgur.com/3KXQPSl.jpg?1", "http://i.imgur.com/j05J4cu.jpg?1", "http://i.imgur.com/qHPQ3QE.jpg?1"]

##create sample themes
4.times do
  Theme.create(name: Faker::Commerce.product_name)
end

@themes = Theme.all
##create sample craft objects
6.times do
  Craft.create(name: Faker::Commerce.product_name,
              description: Faker::Company.catch_phrase,
              source_url: Faker::Internet.url('example.com'),
              image_url: @images.sample,
              theme_id: @themes.sample.id)
end

##create 5 items for each craft
crafts =  Craft.all
crafts.each_with_index do |category, index|
  @craft_id = index + 1
  5.times do
    Item.create(craft_id: @craft_id, name: Faker::Commerce.product_name)
  end
end