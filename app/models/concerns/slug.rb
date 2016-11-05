module Slug
  extend ActiveSupport::Concern

  included do
    before_create :assign_slug
    before_update :assign_slug
  end

  def to_param
    slug
  end

  private
    def assign_slug
      self.slug = "#{Digest::SHA1.hexdigest([Time.now, rand].join)}-#{title.parameterize}"
    end
end
