# == Schema Information
#
# Table name: phones
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  country_code :string
#  area_code    :string
#  extension    :string
#  number       :string
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Phone < ApplicationRecord
  belongs_to :user, inverse_of: :phones
end
