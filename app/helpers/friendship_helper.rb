module FriendshipHelper
  def friend_request_btn(usr)
    if usr.friend_requests.any?(current_user)
      link_to( 'pending friendship request', '#', class: 'btn')
    elsif !(current_user.friend?(usr))
      link_to('add this friend', user_friendships_path , method: :post)
    else
      link_to('delete as friend', destroy_friendship_path, method: :delete)
    end
  end
end