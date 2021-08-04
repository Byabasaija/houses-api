class HousesController < ApplicationController
  skip_before_action :authorize_request
  before_action :set_house, only: %i[show update destroy]

  # GET /houses
  def index
    @houses = House.all
    json_response(@houses)
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

  private

  def house_params
    params.require(:house).permit(:name, :image_url, :description)
  end

  def set_house
    @house = House.find(params[:id])
  end
end
