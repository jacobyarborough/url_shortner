class ShortUrl < ApplicationRecord
  validates :identifier, presence: true, uniqueness: true
  validates :domain, presence: true
  validates :base58, presence: true, uniqueness: true

  belongs_to :long_url

  def short_url
    "#{domain}/#{base58}"
  end
end