require 'rails_helper'

RSpec.describe "Houses", type: :request do
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
 
     context 'when the record does not exist' do
       let(:house_id) { 100 }
 
       it 'returns status code 404' do
         expect(response).to have_http_status(404)
       end
 
       it 'returns a not found message' do
         expect(response.body).to match(/Couldn't find house/)
       end
     end
   end
 
   # Test suite for POST /houses
   describe 'POST /houses' do
     # valid payload
     let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }
 
     context 'when the request is valid' do
       before { post '/houses', params: valid_attributes }
 
       it 'creates a house' do
         expect(json['name']).to eq('Learn Elm')
       end
 
       it 'returns status code 201' do
         expect(response).to have_http_status(201)
       end
     end
 
     context 'when the request is invalid' do
       before { post '/houses', params: { name: 'My House' } }
 
       it 'returns status code 422' do
         expect(response).to have_http_status(422)
       end
 
       it 'returns a validation failure message' do
         expect(response.body)
           .to match(/Validation failed: Created by can't be blank/)
       end
     end
   end
 
   # Test suite for PUT /houses/:id
   describe 'PUT /houses/:id' do
     let(:valid_attributes) { { name: 'Horseman house' } }
 
     context 'when the record exists' do
       before { put "/houses/#{house_id}", params: valid_attributes }
 
       it 'updates the record' do
         expect(response.body).to be_empty
       end
 
       it 'returns status code 204' do
         expect(response).to have_http_status(204)
       end
     end
   end
 
   # Test suite for DELETE /houses/:id
   describe 'DELETE /houses/:id' do
     before { delete "/houses/#{house_id}" }
 
     it 'returns status code 204' do
       expect(response).to have_http_status(204)
     end
   end
    
  
end
