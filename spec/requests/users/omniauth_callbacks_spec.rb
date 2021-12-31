require 'rails_helper'

RSpec.describe "Users::OmniauthCallbacks", type: :request do
  describe "GET /github" do
    it "returns http success" do
      get "/users/auth/github/callback"

      expect(response).to redirect_to(todos_path)
    end
  end

end
