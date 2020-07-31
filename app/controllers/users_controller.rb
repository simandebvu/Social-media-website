class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all_except(current_user)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.friends_and_own_posts.ordered_by_most_recent
    @pending_requests = current_user.pending_friendships
  end
end
