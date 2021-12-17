require 'rails_helper'

RSpec.feature "ShowCompletedTodos", type: :feature do
  background do
    create :todo, content: 'Buy a Milk'
    create :todo, content: 'Go to the Office', completed_at: Time.zone.now

    visit '/todos/completed'
  end

  scenario 'show completed TODOs' do
    within 'ul' do
      expect(page).to have_no_text('Buy a Milk')
      expect(page).to have_text('Go to the Office')
    end
  end

  context 'And visits Incomplete TODOs' do
    background do
      click_link 'Incomplete Todos'
    end

    scenario 'shows incomplete TODOs' do
      within 'ul' do
        expect(page).to have_text('Buy a Milk')
        expect(page).to have_no_text('Go to the Office')
      end
    end
    scenario 'shows the form to register new Todo' do
      within 'form' do
        expect(page).to have_field('Content')
      end
    end
  end
end
