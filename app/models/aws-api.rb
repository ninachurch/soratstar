module AWS

  class Api
    include HTTParty
    base_uri "http://localhost:9393"

    def users
      self.class.get("/v1/users", headers: {"User-Agent" => "My-Face-Is-A-Butt"})
    end

    def posts(user_id)
      self.class.get("/v1/users/#{user_id}/posts")
    end

    def comments(user_id, post_id)
      response = self.class.get("/v1/users/#{user_id}/posts/#{post_id}/comments")
    end
  end