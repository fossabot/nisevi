# == Schema Information
#
# Table name: phones
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  country_code :string
#  area_code    :string
#  extension    :string
#  number       :string           not null
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Phone, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
