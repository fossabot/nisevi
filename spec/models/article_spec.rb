# == Schema Information
#
# Table name: articles
#
#  id               :bigint(8)        not null, primary key
#  title            :string           not null
#  slug             :string           not null
#  description      :text             not null
#  content          :text             not null
#  published        :boolean          default(FALSE), not null
#  accept_comments  :boolean          default(TRUE), not null
#  publication_date :date             not null
#  user_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
