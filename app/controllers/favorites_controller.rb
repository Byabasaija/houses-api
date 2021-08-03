class FavoritesController < ApplicationController
  def index
    favorites = Favorite.favorites
    @favorites = House.find(favorites)

    render json: {
      favorites: @favorites
    }
  end

  def create
    @current_user = User.find_by!(params[:user_id])
    @house = House.find(params[:house_id])
    @favorite = Favorite.create!(user_id: @current_user.id, house_id: @house.id)

    render json: {
      status: :created_successfully,
      favorites: @favorite
    }
  end
end
