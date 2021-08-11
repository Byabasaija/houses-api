class AuthenticationController < ApplicationController
    skip_before_action :authorize_request, only: %i[create]
    def create
        auth_token =
          AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
        user = User.find_by_username!(auth_params[:username])
        json_response(auth_token: auth_token, user: user)
      end

      private
      def auth_params
        params.require(:user).permit(:username, :password)
      end
end
