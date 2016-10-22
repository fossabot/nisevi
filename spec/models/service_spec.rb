# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :string
#  image_path  :string
#  image_url   :string
#  hidden      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Service, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
