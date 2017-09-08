require 'rails_helper'

describe 'Treasure' do
  before do
    user = create(:user)
    login_as(user, scope: :user)
  end

  describe '#index' do
    it 'can be reached successfully' do
      visit treasures_path

      expect(page.status_code).to eq(200)
      expect(page.current_path).to eq(treasures_path)
    end

    it 'has a list of last added treasures' do
      treasure1 = create(:treasure, name: 'First Treasure')
      treasure2 = create(:treasure, name: 'Second Treasure')

      visit treasures_path

      expect(page).to have_text(treasure1.name)
      expect(page).to have_text(treasure2.name)
    end
  end

  describe '#new' do
    it 'has a link from the homepage' do
      visit treasures_path
      click_link 'add_treasure'

      expect(page.status_code).to eq(200)
      expect(page.current_path).to eq(new_treasure_path)
    end
  end
end
