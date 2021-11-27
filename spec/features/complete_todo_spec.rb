require 'rails_helper'

RSpec.feature "CompleteTodos", type: :feature do
  before do
    create :todo, content: 'Buy a Milk'
    create :todo, content: 'Call Back The Office'
  end

  scenario 'Complete Todo' do
    visit '/todos'

    within 'ul li:first-child' do
      expect(page).to have_text('Call Back The Office')
      click_link 'Complete'
    end

    expect(page).to_not have_text('Call Back The Office')
    expect(page).to have_text('Buy a Milk')
  end
end
