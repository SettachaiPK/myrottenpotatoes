class ApplicationController < ActionController::Base
  before_action :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    # we exploit the fact that the below query may return nil
    if session[:user_id] != nil
      @current_user = Moviegoer.find_by(:id => session[:user_id])
    end
  end
end
