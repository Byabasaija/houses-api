class ApplicationController < ActionController::Base
  include Response

  before_action :verify_authenticity_token
end
