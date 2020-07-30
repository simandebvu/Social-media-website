class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friendships.all
  end

  # def new
  #   @friendship = Friendship.new
  # end

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

  # def update
  #   @user = User.find(params[:format])
  #   current_user.confirm_friend(user)
  #   if @friendship.confirm_friend
  #     redirect_to users_path, notice: 'Request accepted'
  #   else
  #     redirect_to users_path, notice: 'theres was a problem with your request'
  #   end
  # end
end
