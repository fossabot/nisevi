# == Schema Information
#
# Table name: addresses
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  city              :string
#  street_name       :string
#  street_number     :string
#  secondary_address :string
#  building_number   :string
#  zip_code          :string
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
