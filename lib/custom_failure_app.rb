class CustomFailureApp < Devise::FailureApp
  def redirect
    store_location!
    message = warden.message || warden_options[:message]
    if message == :timeout
      # Do not redirect to login page after session timeout
      redirect_to attempted_path
    else
      super
    end
  end
end
