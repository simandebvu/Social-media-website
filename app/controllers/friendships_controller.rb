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
    @friendship = current_user.confirmed_friendships.find_by(friend_id: params[:id])
    @friendship.remove_duplicates
    redirect_to users_path, notice: 'Succesfully unfriended.'
  end

  def reject
    @friendship = current_user.incoming_friendships.find_by(user_id: params[:id])
    @friendship.destroy
    redirect_to users_path, notice: 'Rejected request. We wont tell if you wont.'
  end

  def cancel
    @friendship = current_user.pending_friendships.find_by(friend_id: params[:id])
    @friendship.destroy
    redirect_to users_path, notice: 'Phew ! Cancelled request.'
  end
end
