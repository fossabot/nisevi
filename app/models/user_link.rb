# == Schema Information
#
# Table name: user_links
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  link_id    :integer
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserLink < ApplicationRecord
  belongs_to :user
  belongs_to :link

	validates :url, presence: true
end
