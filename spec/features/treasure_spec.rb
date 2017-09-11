require 'rails_helper'

describe 'Treasure' do
  let(:treasure1) { create(:treasure, name: 'First Treasure') }
  let(:treasure2) { create(:treasure, name: 'Second Treasure') }
  let(:warehouse) { create(:warehouse) }
  let(:treasure_name) { I18n.t('activerecord.attributes.treasure.name') }
  let(:treasure_desc) { I18n.t('activerecord.attributes.treasure.description') }
  let(:treasure_warehouse) { I18n.t('activerecord.attributes.treasure.warehouse') }

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
      fill_in treasure_name, with: 'Treasure name'
      fill_in treasure_desc, with: 'Treasure description'
      select(Warehouse.first.name, from: treasure_warehouse)
      click_button 'submit'

      expect(page.current_path).to eq new_treasure_path
      expect(page).to have_content I18n.t('treasure_notice.add')
    end

    it 'cannot add new record whithout name' do
      visit treasures_path
      click_link 'add_treasure'
      fill_in treasure_name, with: ''
      fill_in treasure_desc, with: 'Treasure description'
      select(Warehouse.first.name, from: treasure_warehouse)
      click_button 'submit'

      expect(page).to have_content I18n.t('errors.messages.empty')
    end
  end

  describe 'edit' do
    it 'can be edited' do
      treasure = treasure1

      visit root_path
      click_link "show_#{treasure.id}"
      click_link "edit_#{treasure.id}"
      fill_in treasure_name, with: 'Edited name'
      fill_in treasure_desc, with: 'Edited description'
      select(warehouse.name, from: treasure_warehouse)
      click_button 'submit'

      expect(current_path).to eq treasure_path(treasure1)
      expect(page).to have_content I18n.t('treasure_notice.update')
    end

    it 'cannot be edited' do
      treasure = treasure1

      visit root_path
      click_link "show_#{treasure.id}"
      click_link "edit_#{treasure.id}"
      fill_in treasure_name, with: ''
      fill_in treasure_desc, with: 'Edited description'
      select(warehouse.name, from: treasure_warehouse)
      click_button 'submit'

      expect(page).to have_content I18n.t('errors.messages.empty')
    end
  end

  describe 'delete' do
    it 'can be removed' do
      treasure = treasure1

      visit root_path
      click_link "show_#{treasure.id}"
      click_link "delete_#{treasure.id}"

      expect(current_path).to eq treasures_path
      expect(page).to have_content I18n.t('treasure_notice.remove')
    end
  end
end
