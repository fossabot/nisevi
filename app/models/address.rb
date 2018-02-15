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

class Address < ApplicationRecord
  belongs_to :user, inverse_of: :addresses

  validates :city, :street_name, :street_number, :zip_code, presence: true
end
