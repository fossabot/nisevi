module CommentHelper
  def commenter_image(comment)
    active_image = comment.user.images.active.first
    return active_image.url unless active_image.blank?
    'profile_default.png'
  end
end