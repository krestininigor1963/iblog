require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "article attributes must not be empty" do
  	article = Article.new
  	assert article.invalid?
  	assert article.errors[:title].any?
  	assert article.errors[:body].any?
  	assert article.errors[:status].any?
  end

end
