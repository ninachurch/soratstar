
require_relative '../config/environment'
require 'faker'

##image links

@images = ["http://i.imgur.com/3KXQPSl.jpg?1", "http://imgur.com/j05J4cu", "http://imgur.com/qHPQ3QE"]

##create sample craft objects
6.times do
  Craft.create(name: Faker::Commerce.product_name,
              description: Faker::Company.catch_phrase,
              source_url: Faker::Internet.url('example.com'),
              image_url: @images.sample,
              theme: Faker::Commerce.department)
end

##create 5 items for each craft
crafts =  Craft.all
crafts.each_with_index do |category, index|
  @craft_id = index + 1
  5.times do
    Item.create(category_id: @craft_id, name: Faker::Commerce.product_name)
  end
end