# == Schema Information
#
# Table name: user_links
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  link_id    :integer
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe UserLink, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
