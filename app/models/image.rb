class Image < ApplicationRecord
  belongs_to :article
  belongs_to :portfolio
  belongs_to :service

  scope :article_header, -> { where(article: true, header:true) }
  scope :service_header, -> { where(service: true, header:true) }
  scope :portfolio_header, -> { where(portfolio: true, header:true) }
end
