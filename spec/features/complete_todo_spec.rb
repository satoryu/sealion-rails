require 'rails_helper'

RSpec.feature "CompleteTodos", type: :feature, js: true do
  before do
    create :todo, content: 'Buy a Milk'
    create :todo, content: 'Call Back The Office'
  end

  scenario 'Complete Todo' do
    visit '/todos'

    within first('ul li') do
      expect(page).to have_text('Call Back The Office')
      find_link('Complete').click
    end

    within 'ul' do
      expect(page).to have_no_text('Call Back The Office')
      expect(page).to have_text('Buy a Milk')
    end
  end
end
