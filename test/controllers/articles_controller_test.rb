require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @article = articles(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success # 200 OK
    assert_select "title", "Articles"
  end

  test "should get show" do
    get article_path(@article)
    assert_response :success # 200 OK
    assert_select "title", "Show"
    assert_select "h2", text: "MyArticle1"
  end

  test "should get edit" do
    get edit_article_path(@article)
    assert_response :success # 200 OK
    assert_select "title", "Edit Article"
  end

  test "should get new" do
    get new_article_path
    assert_response :success # 200 OK
    assert_select "title", "New Article"
  end



end
