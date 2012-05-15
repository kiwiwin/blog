require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	test "valid comment" do
		comment = Comment.new
		comment.commenter = "dummy commenter"
		comment.body = "dummy body"
		assert comment.valid?
	end

	test "comment attributes must not be empty" do
		comment = Comment.new
		assert comment.invalid?
		assert comment.errors[:commenter].any?
		assert comment.errors[:body].any?
	end
end
