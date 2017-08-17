class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  http_basic_authenticate_with name: "guest", password: "Datask_dataviz", except: :home
end
