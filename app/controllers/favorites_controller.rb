class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @current_user = User.find(params[:user_id])
    @house = House.find(params[:house_id])
    @favorite = Favorite.create!(user_id: @current_user.id, house_id: @house.id)

    render json: {
      status: :created_successfully,
      favorites: @favorite
    }
  end
end
