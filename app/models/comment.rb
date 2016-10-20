class Comment < ApplicationRecord
  belongs_to :article, inverse_of: :comments
  belongs_to :user, inverse_of: :comments
end
