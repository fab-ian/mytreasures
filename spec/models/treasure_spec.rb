require 'rails_helper'

RSpec.describe Treasure, type: :model do
  let(:treasure) { build_stubbed(:treasure) }

  describe 'Creation' do
    it 'can be created' do
      expect(treasure).to be_valid
    end
  end

  it { should belong_to(:warehouse) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
end
