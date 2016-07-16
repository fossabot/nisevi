class Image < ApplicationRecord
  belongs_to :article
  belongs_to :portfolio
  belongs_to :service
end
