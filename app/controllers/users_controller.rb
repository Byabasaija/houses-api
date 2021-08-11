class UsersController < ApplicationController
  skip_before_action :authorize_request, only: %i[create]

  # def new
  #   auth_token =
  #     AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
  #   user = User.find_by_username!(auth_params[:username])
  #   json_response(auth_token: auth_token, user: user)
  # end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    response = { message: Message.account_created, auth_token: auth_token, user: user }
    json_response(response, :created)
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation
    )
  end
end
