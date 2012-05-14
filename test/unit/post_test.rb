require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "post attributes must not be empty" do
		post = Post.new
		assert post.invalid?
		assert post.errors[:name].any?
		assert post.errors[:title].any?
		assert post.errors[:content].any?
	end
end
