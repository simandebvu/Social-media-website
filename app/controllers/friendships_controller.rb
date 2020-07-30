class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friendships.all
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:id], confirmed: false)
    if @friendship.save
      redirect_to users_path, notice: 'Sent request succesfully!'
    else
      redirect_to users_path, notice: 'Already requested this user.'
    end
  end

  def destroy
    @friendship = Friendship.find_by(params[:user_id], friend_id: params[:id])
    if @friendship
      @friendship.destroy
      redirect_to users_path, notice: 'Succesfully unfriended.'
    else
      redirect_to root_path, notice: 'You cant do this.'
    end
  end

  def accept
    @user = User.find(params[:id])
    current_user.confirm_friend(@user)
    redirect_to users_path, notice: 'You are now friends.'
  end
  
end
