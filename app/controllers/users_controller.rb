class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @follow = Follow.new(followed_user_id: params[:id])
  end
  def index
    if params[:query] == 'following'
      @users = current_user.following_users
    else
      @users = User.all
    end
  end
end
