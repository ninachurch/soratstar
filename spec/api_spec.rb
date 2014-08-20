require 'spec_helper'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

describe "index controller" do
  describe "GET /v1/users/:id/posts" do
    it "responds successfully" do
      stub_request(:get, "http://salty-forest-9352.herokuapp.com/v1/users/1/posts").
         to_return(:status => 200, :body => "[]", :headers => {})

      get '/v1/users/1/posts'
      expect(last_response.status).to eq(200)
    end
end