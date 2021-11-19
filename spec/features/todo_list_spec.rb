require 'rails_helper'

RSpec.feature "TodoLists", type: :feature do
  before do
    create :todo, content: 'Buy a milk'
    create :todo, content: 'Call back the office'
  end

  scenario 'Show all registered todos' do
    visit '/todos'

    expect(page).to have_text('Buy a milk')
    expect(page).to have_text('Call back the office')
  end
end
