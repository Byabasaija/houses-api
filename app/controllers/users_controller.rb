class UsersController < ApplicationController
    skip_before_action :authorize_request, only: [:create, :login]
    
   
def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    response = { message: Message.account_created, auth_token: auth_token, user: user}
    json_response(response, :created)
  end


def login
     user = User.find_by_username!(auth_params[:username])

    auth_token =
      AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
    json_response( auth_token: auth_token, user: user)
    
  end

  private
  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation
    )
  end

  def auth_params
    params.require(:user).permit(:username, :password)
  end
     
end
