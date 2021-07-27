require 'rails_helper'

RSpec.describe User, type: :model do # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:favorites) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:username) }
end
