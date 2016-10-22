# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  token      :string
#  secret     :string
#  image_path :string
#  image_url  :string
#  expires    :boolean
#  expires_at :date
#  raw_info   :jsonb            not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Identity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
