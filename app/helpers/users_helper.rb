<<<<<<< HEAD
module UsersHelper  
  def user_avatar(user,classes)
    if user.avatar.present?
      image_tag(user.avatar.url, class: classes)
    else
      image_tag("/images/avatar.jpg", class: classes)
    end
  end
=======
module UsersHelper
>>>>>>> d02abb19a36d235532ee6ae9be242b4e05ec60a5
end
