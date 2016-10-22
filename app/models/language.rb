# == Schema Information
#
# Table name: languages
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string(200)
#  description  :text
#  url_language :string(200)
#  obtained     :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Language < ApplicationRecord
  belongs_to :user, inverse_of: :languages
end
