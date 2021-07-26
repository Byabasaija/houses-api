class ApplicationController < ActionController::Base
  include Response
  # include ExceptionHandler

  before_action :verify_authenticity_token

  
end
