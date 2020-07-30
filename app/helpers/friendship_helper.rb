module FriendshipHelper
  def friendship_status_btn(usr)
    if usr.friend_requests.any?(current_user)
      link_to( 'Pending', '#', class: 'btn btn-info')
    elsif !(current_user.friend?(usr))
      link_to('Add', request_friendship_user_path(usr.id), method: :post, class: 'accept btn btn-secondary')
    else
      link_to 'Unfriend', unfriend_user_path(usr), method: :delete, class: 'profile-link btn btn-secondary'
    end
  end
end