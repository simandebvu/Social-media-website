module UsersHelper
  def confirm_btn(usr)
    return unless current_user.friend_requests
    (link_to('Accept', accept_user_path(usr), method: :put, class: 'accept profile-link btn btn-secondary')) << (link_to('Reject', unfriend_user_path(usr), method: :delete, class: "reject btn profile-link btn-secondary"))
  end

  def confirm_friendship_btn(usr)
    if current_user.friend_requests.any?(usr)
      confirm_btn(usr)
    else
      friendship_status_btn(usr)
    end
  end

  def friendship_btn(usr)
    if current_user != @user && current_user.friend_requests.none?(@user)
      friendship_status_btn(usr)
    elsif current_user.friend_requests.any?(@user)
      confirm_btn(usr)
    end
  end
end