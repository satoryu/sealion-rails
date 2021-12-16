require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe '.completed' do
    let!(:completed_todo) { create :todo, content: 'Bar', completed_at: Time.zone.now }

    before do
      create :todo, content: 'Foo'
    end

    it 'fetches only incomplete todos' do
      todos = Todo.completed

      expect(todos).to contain_exactly(completed_todo)
    end
  end

  describe '.incomplete' do
    let!(:incomplete_todo) { create :todo, content: 'Foo' }

    before do
      create :todo, content: 'Bar', completed_at: Time.zone.now
    end

    it 'fetches only incomplete todos' do
      todos = Todo.incomplete

      expect(todos).to contain_exactly(incomplete_todo)
    end
  end
end
