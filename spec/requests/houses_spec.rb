require 'rails_helper'

RSpec.describe 'Houses', type: :request do
  # initialize test data

  let!(:houses) { create_list(:house, 10) }
  let(:house_id) { houses.first.id }

  # Test suite for GET /houses
  describe 'GET /houses' do
    # make HTTP get request before each example
    before { get '/houses' }

    it 'returns houses' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /houses/:id
  describe 'GET /houses/:id' do
    before { get "/houses/#{house_id}" }

    context 'when the record exists' do
      it 'returns the house' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(house_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for POST /houses
  describe 'POST /houses' do
    # valid payload
    let(:house) do
      { name: 'Learn Elm',
        image_url: 'https://loremflickr.com/cach.jpg',
        description: 'Find Cheap Houses for Sale in Kampala Uganda at very affordable prices' }
    end

    context 'when the request is valid' do
      before { post '/houses', params: house }

      it 'creates a house' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
