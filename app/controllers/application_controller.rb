class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  # following lines: found on stackoverflow, to prevent activemodel error due to CanCan when registering
  before_action do
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
end
end
