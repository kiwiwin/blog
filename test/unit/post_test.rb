require 'test_helper'

class PostTest < ActiveSupport::TestCase
	test "valid post" do
		post = Post.new
		post.title = "tile is more than 5 characters"
		post.content = "dummy content"
		assert post.valid?
	end

	test "post attributes must not be empty" do
		post = Post.new
		assert post.invalid?
		assert post.errors[:title].any?
		assert post.errors[:content].any?
	end

	test "post title length must not less than 5" do
		post = Post.new
		post.title = "abc"
		post.content = "dummy content"
		assert post.invalid?
		assert post.errors[:content].empty?
		assert_equal post.errors[:title], ["is too short (minimum is 5 characters)"]
	end
end
