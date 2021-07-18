require 'rails_helper'

RSpec.describe User, type: :model do
   # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:favorites).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
end
