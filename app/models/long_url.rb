class LongUrl < ApplicationRecord
  validates :url, presence: :true, uniqueness: true

  has_one :short_url
end