class LongUrl < ApplicationRecord
  validates :full_url, presence: :true, uniqueness: true

  has_one :short_url
end