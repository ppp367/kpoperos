class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  before_filter :set_locale
	def set_locale
	    I18n.locale = params[:locale] || I18n.default_locale
	end

	protect_from_forgery

	def default_url_options(options={})
	 logger.debug "default_url_options is passed options: #{options.inspect}\n"
	 { :locale => I18n.locale }
	end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:username, :fullname, :email, :password, :password_confirmation , :type]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
