require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  let(:warehouse) { build_stubbed(:warehouse) }

  describe 'Creation' do
    it 'can be created' do
      expect(warehouse).to be_valid
    end
  end

  describe 'Validation' do
    it 'cannot be created without a name' do
      warehouse.name = nil
      warehouse.valid?
      expect(warehouse.errors[:name].size).to eq(1)
    end
  end
end
