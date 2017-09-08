require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    it 'can be reached successfully' do
      user = create(:user)
      login_as(user)

      visit treasures_path
      expect(page.current_path).to eq(treasures_path)
    end
  end
end
