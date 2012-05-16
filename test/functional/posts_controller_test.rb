require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

	def authenticate 
		request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("kiwi","314")
	end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
		authenticate
    get :new
    assert_response :success
  end

	test "should redirect to 401 with unauthenticated user get new" do
    get :new
    assert_response 401
	end

  test "should create post" do
		authenticate
    assert_difference('Post.count') do
      post :create, post: { content: @post.content, title: @post.title }
    end

    assert_redirected_to post_path(assigns(:post))
  end

	test "should redirect to 401 for unauthenticated user create post" do
    assert_no_difference('Post.count') do
      post :create, post: { content: @post.content, title: @post.title }
    end

    assert_response 401
	end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
		authenticate
    get :edit, id: @post
    assert_response :success
  end

  test "should redirect to 401 for authenticated user get edit" do
    get :edit, id: @post
    assert_response 401
  end

  test "should update post" do
		authenticate
    put :update, id: @post, post: { content: @post.content, title: @post.title }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should redirect to 401 for authenticated user update post" do
    put :update, id: @post, post: { content: @post.content, title: @post.title }
    assert_response 401
  end

  test "should destroy post" do
		authenticate
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end

  test "should redirect to 401 for authenticated user destroy post" do
    assert_no_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_response 401
  end
end
