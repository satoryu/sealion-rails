require 'rails_helper'

RSpec.feature "TodoLists", type: :feature do
  scenario '' do
    visit '/todos'

    expect(page).to have_text('Buy a milk')
    expect(page).to have_text('Call back the office')
  end
end
