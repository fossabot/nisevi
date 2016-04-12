class Article < ActiveRecord::Base

  has_many :comments

  validates :title, :text, presence: true

end
