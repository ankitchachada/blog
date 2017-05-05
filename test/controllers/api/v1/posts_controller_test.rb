require 'test_helper'

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
   test "creates posts" do
    assert_difference -> { Post.count } do
      post posts_path, params: { article: { title: "Ahoy!" } }, as: :json
    end

    assert_response :success
    assert_equal({ id: Post.last.id, title: "Ahoy!" }, response.parsed_body)
  end
end
