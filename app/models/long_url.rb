class LongUrl < ApplicationRecord
  validates :full_url, presence: :true, uniqueness: true
end