class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def page_classes
    [:conference, controller_name, action_name].join(' ')
  end
  helper_method :page_classes
end
