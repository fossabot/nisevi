# == Schema Information
#
# Table name: addresses
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  city              :string           not null
#  street_name       :string           not null
#  street_number     :string           not null
#  secondary_address :string
#  building_number   :string
#  zip_code          :string           not null
#  time_zone         :string
#  state             :string
#  state_abbr        :string
#  country           :string
#  country_code      :string
#  notes             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
