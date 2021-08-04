class Favorite < ApplicationRecord
  belongs_to :house
  belongs_to :user

  scope :favorites, lambda {
    order(created_at: :desc).pluck(:house_id)
  }
end
