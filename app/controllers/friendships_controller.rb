class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.new
    @friendship.friend_id = params[:format]
    @friendship.user_id = current_user.id
    @friendship.confirmed = false
    @friendship.save
    if @friendship.save
      redirect_to users_path, notice: 'Friend request sent.'
    else
      redirect_to users_path, notice: 'theres was a problem with your request'
    end
  end

  def destroy
  @friendship = Friendship.find_by(user_id: params[:format], friend_id: current_user.id)
  @friendship.destroy
  if @friendship.destroy
    redirect_to users_path, notice: 'Request rejected'
  else
    redirect_to users_path, notice: 'theres was a problem with your request'
  end
  end

  def update
    @user = User.find(params[:format])
    current_user.confirm_friend(user)
    if @friendship.confirm_friend
      redirect_to users_path, notice: 'Request accepted'
    else
      redirect_to users_path, notice: 'theres was a problem with your request'
    end
  end
end