require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  describe 'GET /' do
    it "returns http success" do
      get '/todos'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(assigns(:todos)).to be_empty
      expect(assigns(:todo)).to be_a(Todo)
    end

    context 'When some todos have been already registered' do
      let!(:todos) { create_list :todo, 2 }

      it 'returns http success' do
        get '/todos'

        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
        expect(assigns(:todos)).to match_array(todos)
      end
    end
  end

  describe 'POST /todos' do
    it 'redirects to the index' do
      post todos_path, params: { todo: { content: 'Buy a New Gudget' } }

      expect(response).to redirect_to(todos_path)
    end
    it 'creates new Todo' do
      expect {
        post todos_path, params: { todo: { content: 'Buy a New Gudget' } }
      }.to change(Todo, :count).by(1)
    end

    context 'When content is not given' do
      it 'renders index' do
        post todos_path, params: { todo: { content: '' } }

        expect(response).to have_http_status(:bad_request)
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'POST /todos/:id/complete' do
    let!(:todo) { create :todo, content: 'Buy a Milk' }

    it 'redirect to todos' do
      post complete_todo_path(todo)

      expect(response).to redirect_to todos_path
    end

    context 'When given id does not exist' do
      it 'renders index with not found' do
        post complete_todo_path('INVALID_ID')

        expect(response).to redirect_to todos_path
        expect(assigns(:todos)).to match_array(Todo.all)
        expect(assigns(:todo)).to be_new_record
      end
    end
  end
end
