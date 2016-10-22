# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ApplicationRecord
  has_many :user_links, dependent: :destroy
  has_many :users, through: :user_links
end
