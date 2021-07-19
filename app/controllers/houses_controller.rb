class HousesController < ApplicationController
  before_action :set_house, only: %i[show update destroy]

  # GET /houses
  def index
    @houses = House.all
    json_response(@houses)
    @houses = @houses.favorited_by(params[:favorited]) if params[:favorited].present?
  end

  # POST /houses
  def create
    @house = House.create!(house_params)
    json_response(@house, :created)
  end

  # GET /houses/:id
  def show
    json_response(@house)
  end

  # PUT /houses/:id
  def update
    @house.update(house_params)
    head :no_content
  end

  # DELETE /houses/:id
  def destroy
    @house.destroy
    head :no_content
  end

  private

  def house_params
    # whitelist params
    params.permit(:name, :image_url, :description)
  end

  def set_house
    @house = House.find(params[:id])
  end
end
