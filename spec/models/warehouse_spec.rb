require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  let(:warehouse) { build_stubbed(:warehouse) }

  describe 'Creation' do
    it 'can be created' do
      expect(warehouse).to be_valid
    end
  end

  it { should have_many(:treasures) }
  it { should validate_presence_of(:name) }
end
