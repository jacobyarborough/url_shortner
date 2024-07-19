require 'rails_helper'

Rspec.describe ShortUrl do
  describe 'validations' do
    it { should validate_presence_of :identifier }
    it { should validate_uniqueness_of :identifier }
    it { should validate_presence_of :short_url }
    it { should validate_uniqueness_of :short_url }
  end

  describe 'associations' do
    it { should belong_to :long_url }
  end
end