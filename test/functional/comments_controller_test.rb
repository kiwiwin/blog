require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
	setup do
		@post = posts(:one)
		comment = comments(:one)
		@comment = @post.comments.create( { commenter: comment.commenter, body: comment.body } )
	end

	def authenticate 
		request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("kiwi","314")
	end

	test "should create comment" do 
		assert_difference('Comment.count') do
      post :create,  comment: { commenter: @comment.commenter, body: @comment.body }, post_id: @post 
    end

    assert_redirected_to post_path(assigns(:post))
	end

	test "should destroy comment" do
		authenticate
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment, post_id: @post
    end

    assert_redirected_to post_path(assigns(:post))
	end

	test "should redirect to 401 for unauthenticated user destroy comment" do
		assert_no_difference('Comment.count', -1) do
      delete :destroy, id: @comment, post_id: @post
    end

    assert_response 401
	end
end
