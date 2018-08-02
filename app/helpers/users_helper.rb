module UsersHelper  
  def user_avatar(user,classes)
    if user.avatar.present?
      image_tag(user.avatar.url, class: classes)
    else
      image_tag("/images/avatar.jpg", class: classes)
    end
  end
end
