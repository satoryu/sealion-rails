require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  describe 'GET /' do
    it "returns http success" do
      get '/todos'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(assigns(:todos)).to be_empty
    end

    context 'When some todos have been already registered' do
      let(:todos) { create_list :todo, 2 }

      it 'returns http success' do
        get '/todos'

        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
        expect(assigns(:todos)).to eql(todos)
      end
    end
  end
end
