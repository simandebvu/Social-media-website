module UsersHelper
  def confirm_btn(usr)
    link_to('Accept', accept_user_path(usr), method: :put, class: 'accept profile-link btn btn-secondary') << link_to('Reject', reject_user_path(usr), method: :delete, class: 'reject btn profile-link btn-secondary')
  end

  def confirm_friendship_btn(usr)
    if current_user.pending_request_with usr
      confirm_btn(usr)
    elsif current_user.friend? usr
      link_to 'Unfriend', unfriend_user_path(usr), method: :delete, class: 'profile-link btn btn-secondary'
    elsif current_user.sent_request?(usr)
      link_to('Cancel', cancel_user_path(usr), method: :delete, class: 'btn btn-secondary')
    else
      link_to('Add', request_friendship_user_path(usr.id), method: :post, class: 'accept btn btn-secondary')
    end
  end
end
