# spec/requests/favorites_spec.rb
require 'rails_helper'

RSpec.describe 'favorites API' do
  let(:user) { create(:user) }
  let!(:house) { create(:house) }
  let!(:favorites) { create_list(:favorite, 20, house_id: house.id, user_id: user.id) }
  let(:house_id) { house.id }
  let(:id) { favorites.first.id }
  let(:headers) { valid_headers }
end
