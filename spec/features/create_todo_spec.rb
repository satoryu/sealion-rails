require 'rails_helper'

RSpec.feature "CreateTodos", type: :feature do
  scenario 'Create new Todo' do
    visit '/todos'

    fill_in 'Content', with: 'Buy a New Gudget'
    click_button 'Create Todo'

    expect(page).to have_text('Buy a New Gudget')
  end
end
