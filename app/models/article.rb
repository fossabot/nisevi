class Article < ActiveRecord::Base

  has_many :articles

  validates :title, :text, presence: true

end
