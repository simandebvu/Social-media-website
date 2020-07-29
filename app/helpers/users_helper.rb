module UsersHelper
  def confirm_friendship(usr)
    return unless current_user.friend_requests.any?
    (link_to('Like!', post_likes_path(post_id: post.id), method: :post)) << (link_to('Lidsde!', post_likes_path(post_id: post.id), method: :post))
  end

  def friendship_status(usr)
    if current_user.friend_requests.any?(usr)
      confirm_friendship(usr)
    else
      friend_request_btn(usr)
    end
  end

  def friendship_show(usr)
    if current_user != @user && current_user.friend_requests.none?(@user)
      friend_request_btn(usr)
    elsif current_user.friend_requests.any?(@user)
      confirm_friendship(usr)
    end
  end
end