class UsersController < ApplicationController
    skip_before_action :authorize_request, only: [:create, :login]
def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end


def login
    auth_token =
      AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  private
  def user_params
    params.permit(
      :username,
      :password,
      :password_confirmation
    )
  end

  def auth_params
    params.permit(:username, :password)
  end
     
#   include CurrentUserConcern

#   def create
#     user = User
#       .find_by(username: params['user']['username'])
#       .try(:authenticate, params['user']['password'])

#     if user
#       session[:user_id] = user.id
#       render json: {
#         status: :created,
#         logged_in: true,
#         user: user
#       }
#     else
#       render json: { status: 401 }
#     end
#   end

#   def destroy
#     reset_session
#     render json: { status: 200, logged_in: false }
#   end

#   def show
#     @current_user = User.find(params[:id])
#     favorites = Favorite.where(user_id: @current_user.id).order(created_at: :desc).pluck(:house_id)
#     @favorites = House.find(favorites)
#     render json: {
#       favorites: @favorites
#     }
#   end
#     def create
#       user = User
#         .create!(
#           username: params['user']['username'],
#           password: params['user']['password'],
#           password_confirmation: params['user']['password_confirmation']
#         )
  
#       if user
#         session[:user_id] = user.id
#         render json: {
#           status: :created,
#           logged_in: true,
#           user: user
#         }
#       else
#         render json: { status: 500 }
#       end
#     end
end
