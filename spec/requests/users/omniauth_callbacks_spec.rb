require 'rails_helper'

RSpec.describe "Users::OmniauthCallbacks", type: :request do
  describe "GET /github" do
    before do
      Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    end

    it "returns redirects to todos page" do
      get "/users/auth/github/callback"

      expect(response).to redirect_to(todos_path)
    end
    it "creates user record" do
      expect {
        get "/users/auth/github/callback"
      }.to change(User, :count).by(1)
    end
  end
end
