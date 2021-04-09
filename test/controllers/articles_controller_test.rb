require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @article = articles(:one)
    @comment = comments(:one)
    @user = users(:michael)
  end

  test "should get index" do
    get articles_url
    assert_response :success # 200 OK
    assert_select "title", "Articles | Ruby on Rails Sample iBlog"
  end

  test "should get show" do
    get article_path(@article)
    assert_response :success # 200 OK
    assert_select "title", "Show Articles | Ruby on Rails Sample iBlog"
    assert_select "h2", text: "articleone"
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_article_path(@article)
    assert_response :success # 200 OK
    assert_select "title", "Edit Article | Ruby on Rails Sample iBlog"
  end

  test "should get new" do
    get new_article_path
    assert_response :success # 200 OK
    assert_select "title", "New Article | Ruby on Rails Sample iBlog"
  end


  test "should redirect create when not logged in" do
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: {title: "articleone", body: "bodytext_articleone", status: "public"} }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference "Article.count" do
      delete article_path(@article) 
    end
    assert_redirected_to login_url
  end 

  


end
