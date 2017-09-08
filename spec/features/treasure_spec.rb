require 'rails_helper'

describe 'Treasure' do
  let(:treasure1) { create(:treasure, name: 'First Treasure') }
  let(:treasure2) { create(:treasure, name: 'Second Treasure') }

  before do
    user = create(:user)
    login_as(user, scope: :user)
  end

  describe 'navigate' do
    describe '#index' do
      it 'can be reached successfully' do
        visit treasures_path

        expect(page.status_code).to eq(200)
        expect(page.current_path).to eq(treasures_path)
      end

      it 'has a list of last added treasures' do
        treasure1
        treasure2
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

  describe 'creation' do
    it 'can add new record' do
      visit treasures_path
      click_link 'add_treasure'
      fill_in I18n.t('activerecord.attributes.treasure.name'), with: 'Treasure name'
      fill_in I18n.t('activerecord.attributes.treasure.description'), with: 'Treasure description'
      select(Warehouse.first.name, from: I18n.t('activerecord.attributes.treasure.warehouse'))
      click_button 'submit'

      expect(page.current_path).to eq new_treasure_path
      expect(page).to have_content I18n.t('treasure_notice.add')
    end
  end
end
