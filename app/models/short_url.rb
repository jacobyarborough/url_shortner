class ShortUrl < ApplicationRecord
  validates :identifier, presence: true, uniqueness: true

  belongs_to :long_url

  def url(base58)
    "localhost:3000/#{base58}"
  end
end