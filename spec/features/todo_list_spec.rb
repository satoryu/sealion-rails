require 'rails_helper'

RSpec.feature "TodoLists", type: :feature do
  before do
    create :todo, content: 'Buy a milk'
    create :todo, content: 'Call back the office'
    create :todo, content: 'Go to the Office' # Completed one
  end

  scenario 'Show all registered todos' do
    visit '/todos'

    expect(page).to have_text('Buy a milk')
    expect(page).to have_text('Call back the office')
    expect(page).to have_no_text('Go to the Office')
  end
end
