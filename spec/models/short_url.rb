require 'rails_helper'

Rspec.describe ShortUrl do
  describe 'validations' do
    it { should validate_presence_of :identifier }
    it { should validate_uniqueness_of :identifier }
    it { should validate_presence_of :base58 }
    it { should validate_uniqueness_of :base58 }
    it { should validate_presence_of :domain }
  end

  describe 'associations' do
    it { should belong_to :long_url }
  end
end