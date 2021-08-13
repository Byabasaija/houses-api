require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  # Authentication test suite
  describe 'POST /auth/login' do
    # create test user
    let!(:user) { create(:user) }
    # set headers for authorization
    let(:headers) { valid_headers.except('Authorization') }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        username: user.username,
        password: user.password
      }.to_json
    end
    let(:invalid_credentials) do
      {
        username: Faker::Internet.username,
        password: Faker::Internet.password
      }.to_json
    end

    # set request.headers to our custon headers
    # before { allow(request).to receive(:headers).and_return(headers) }
  end
end
