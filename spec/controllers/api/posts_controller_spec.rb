require "rails_helper"  

RSpec.describe "Api::V1::PostsController" do
  describe "GET /posts" do
    it "will retrieve posts" do
    	get 'api/v1/posts'
    	#expect(JSON.parse(response.body))
    end
  
  end
end