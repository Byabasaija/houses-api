class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  include CurrentUserConcern

  def create
    user = User
      .find_by(username: params['user']['username'])
      .try(:authenticate, params['user']['password'])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401}
    end
  end

  def destroy
    reset_session
    render json: { status: 200, logged_in: false }
  end

  def show
    favorites = Favorite.where(user_id: @current_user.id).order(created_at: :desc).pluck(:house_id)
    @favorites = House.find(favorites)
    render json: {
      favorites: @favorites
    }
  end
end
