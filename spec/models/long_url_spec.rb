require 'rails_helper'

RSpec.describe LongUrl do
  describe 'validations' do
    it { should validate_presence_of :url }
    it { should validate_uniqueness_of :url}
  end

  describe 'associations' do
    it { should have_one :short_url }
  end
end