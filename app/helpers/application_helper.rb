module ApplicationHelper
  def user_image(user)
    active_image = user.images.active.first
    return active_image.url unless active_image.blank?
    'profile_default.png'
  end

  def social_links
    User.find_by_admin(:true).user_links.includes(:link)
  end
end