require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe '.completed' do
    let!(:completed_todo) { create :todo, :completed, content: 'Bar' }

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
      create :todo, :completed, content: 'Bar'
    end

    it 'fetches only incomplete todos' do
      todos = Todo.incomplete

      expect(todos).to contain_exactly(incomplete_todo)
    end
  end

  describe '#completed?' do
    let(:incomplete_todo) { create :todo, content: 'Foo' }
    let(:completed_todo) { create :todo, :completed, content: 'Bar' }

    it 'returns true if it is completed' do
      expect(incomplete_todo).to_not be_completed
      expect(completed_todo).to be_completed
    end
  end
end
