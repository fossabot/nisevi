class WelcomeController < ApplicationController
  def index
    @contact = Contact.new
    @admin_user = User.find_by_admin(:true)

    # This condition was created only to not break
    # the views when no data has been generated.
    if @admin_user
      @articles   = @admin_user.articles.published.last(3)
      @portfolios = @admin_user.portfolios.published.last(3)
      @services   = @admin_user.services.active.last(4)
    else
      @articles   = []
      @portfolios = []
      @services   = []
    end
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if verify_recaptcha(model: @contact) && @contact.save
        # Tell ContactMailer to send a welcome email after save
        ContactMailer.contact_email(@contact).deliver
        # Tell ContactMailer to send the client message
        ContactMailer.client_message(@contact).deliver

        format.html { render action: :index }
        format.js {}
      else
        format.html { render action: :index }
        format.js {}
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
