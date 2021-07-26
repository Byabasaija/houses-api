class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  include CurrentUserConcern
  def create
    @house = House.find(params[:house_id])
      @favorite = Favorite.create!(user_id: @current_user.id, house_id: @house.id)

      render json: {
        status: :created_successfully,
        favorites: @favorite
      }
  end
end
