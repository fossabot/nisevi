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

class Address < ApplicationRecord
  belongs_to :user, inverse_of: :addresses
end
