class LoginController < ApplicationController
  def new
  end

  def create
		if params[:admin] == 'kiwi' and params[:password] == '314'
			session[:admin] = true
			redirect_to posts_url
		else
			redirect_to login_url, alert: "Invalid admin/password combination"
		end
  end

  def destroy
		session[:admin] =  nil
		redirect_to login_url, alert: "Already Logged out"
  end
end
