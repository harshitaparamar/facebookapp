class ApplicationController < ActionController::Base
    before_action :configure_sign_up_params, if: :devise_controller?
    before_action :configure_account_update_params, if: :devise_controller?
    before_action :user_suspended?

    # before_action :user_suspended
    
    
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end
  private 

  def user_suspended?
    if current_user.present? && current_user.suspended?
      sign_out current_user
      flash[:alert] = "This account has been suspended"
      root_path
    end
  end
  # def user_suspended!
  #   if  user_signed_in? && current_user.suspended?
  #     redirect_to "/users/sign_in", alert: "Your account is suspended"
      
  #   end

  # end
  # def user_suspended
  #   if user_signed_in?
  #     super unless current_user.suspended?
  #   else
  #     redirect_to new_user_session_path
  #   end
  # end
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :profile_image])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :profile_image])
  end

    
end
