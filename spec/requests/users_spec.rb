require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /auth/login' do
    # create test user
    let!(:user) { create(:user) }
    # set headers for authorization
    let(:headers) { valid_headers.except('Authorization') }
    # set test invalid credentials

    let(:invalid_credentials) do
      {
        username: Faker::Internet.username,
        password: Faker::Internet.password
      }.to_json
    end

    # returns failure message when request is invalid
    context 'When request is invalid' do
      before { post '/auth/login', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
