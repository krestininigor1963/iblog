require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "comment attributes must not be empty" do
	  	comment = Comment.new
	  	assert comment.invalid?
	  	assert comment.errors[:commenter].any?
	  	assert comment.errors[:body].any?
	  	assert comment.errors[:status].any?
	  end

end
