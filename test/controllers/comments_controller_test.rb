require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@article = articles(:one)
  	@comment = comments(:one)
  end

  test "should get comments" do
    #get article_comment_path(@article)
    #assert_response :success # 200 OK
    #assert_select 'title' 
  end


end
