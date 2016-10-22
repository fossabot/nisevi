# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  identity_id :integer
#  article_id  :integer
#  service_id  :integer
#  url         :text
#  path        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
