class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!
  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    #user_signed_in? ? current_user.id : 'Public user'
     'Public user'
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :role])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
  end

  def after_sign_in_path_for(resource)
    dashboard_path  # chatrooms_path #your path
  end
  
  def current_team
    @current_team ||= current_user.teams.find(session[:team_id])
  rescue ActiveRecord::RecordNotFound
    @current_team ||= current_user.teams.first
    @current_team ||= current_user.create_personal_team
  end
  helper_method :current_team

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    # current_user.locale
    # request.env["HTTP_ACCEPT_LANGUAGE"]
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
