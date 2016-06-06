class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.from_omniauth(request.env["omniauth.auth"], current_user)
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          session[:check_omniauth_provider] = "#{provider}"
          if is_navigational_format?
            set_flash_message(:notice, :success, kind: "#{provider}".capitalize)
          end
        else
          session["devise.user_attributes"] = @user.attributes
          redirect_to new_user_registration_url
        end
      end
    }
  end

  # Another providers supported are :google, :linkedin and :facebook
  [:linkedin, :github].each do |provider|
    provides_callback_for provider
  end
end
