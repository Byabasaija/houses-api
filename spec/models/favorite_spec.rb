require 'rails_helper'

RSpec.describe Favorite, type: :model do
   # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should belong_to(:user) }
  it { should belong_to(:house) } 
end
