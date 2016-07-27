class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_beginning_of_week, if: :signed_in?

  private
 
    def set_beginning_of_week
      Date.beginning_of_week = :sunday
    end

end
