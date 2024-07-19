class ShortUrl < ApplicationRecord
  validates :identifier, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  validates :domain, presence: true
  validates :base58, presence: true, uniqueness: true

  belongs_to :long_url
end