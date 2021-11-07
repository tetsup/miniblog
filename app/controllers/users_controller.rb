class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @follow = Follow.new(followed_user_id: params[:id])
  end
end
