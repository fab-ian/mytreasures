require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe 'Creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end
  end

  describe 'Validation' do
    it 'cannot be created without a name' do
      @user.name = nil
      @user.valid?
      expect(@user.errors[:name].size).to eq(1)
    end

    it 'cannot be created without an email' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email].size).to eq(1)
    end

    it 'cannot be created without a locale' do
      @user.locale = nil
      @user.valid?
      expect(@user.errors[:locale].size).to eq(1)
    end

    it 'cannot be created without assigment to at least one role' do
      @user.roles_mask = 0
      @user.valid?
      expect(@user.errors[:roles_mask].size).to eq(1)
    end
  end
end
