module Amazon
  class Client
    include amazon-ecs

    def request
      ENV['AWS_ACCESS_KEY_ID']
      all_res = Amazon::Ecs.item_search("#{item.name}", :search_index => 'All')
      @top_res = all_res.items.first
    end
  end
end
