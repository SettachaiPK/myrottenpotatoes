class ApplicationController < ActionController::Base
  before_action :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    # we exploit the fact that the below query may return nil
    @current_user ||= Moviegoer.find_by(:id => session[:user_id])
    redirect_to login_path and return unless @current_user
  end

  require 'themoviedb'
  Tmdb::Api.key("b6067665a4204577984f4ea3bbf4274f")
  Tmdb::Api.language("en")

  def set_config
    @configuration = Tmdb::Configuration.new
  end

end
