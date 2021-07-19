class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :favorites, dependent: :destroy
  # Validations
  validates_presence_of :name, :email, :password_digest

  def favorite(favorite)
    favorites.find_or_create_by(favorite: favorite)
  end

  def unfavorite(favorite)
    favorites.where(favorite: favorite).destroy_all

    favorite.reload
  end

  def favorited?(favorite)
    favorites.find_by(favorite_id: favorite.id).present?
  end
end
