class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected  

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      request.referer || posts_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| 
      u.permit(:first_name, :last_name,:email, :password)
    }

    devise_parameter_sanitizer.permit(:account_update) { |u| 
      u.permit(:first_name, :last_name, :email, :password, :current_password)
    }
  end

end
