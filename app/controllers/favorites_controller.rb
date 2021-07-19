class FavoritesController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_house!

  def create
    current_user.favorite(@favorite)

    json_response(@favorite, :created)
  end

  def destroy
    current_user.unfavorite(@favorite)

    head :no_content
  end

  private

  def find_house!
    @favorite = House.find_by_id!(params[:house_id])
  end
end
