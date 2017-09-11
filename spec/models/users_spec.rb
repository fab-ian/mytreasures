require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build_stubbed(:user) }

  describe 'Creation' do
    it 'can be created' do
      expect(user).to be_valid
    end
  end

  it { should have_many(:treasures) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:locale) }
  it { should validate_numericality_of(:roles_mask).is_greater_than(0) }
end
