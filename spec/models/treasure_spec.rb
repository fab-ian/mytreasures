require 'rails_helper'

RSpec.describe Treasure, type: :model do
  let(:treasure) { build_stubbed(:treasure) }

  describe 'Creation' do
    it 'can be created' do
      expect(treasure).to be_valid
    end
  end

  describe 'Validation' do
    it 'cannot be created without a name' do
      treasure.name = nil
      treasure.valid?
      expect(treasure.errors[:name].size).to eq(1)
    end
  end
end
