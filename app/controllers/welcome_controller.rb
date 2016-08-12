class WelcomeController < ApplicationController
  def index
    @contact = Contact.new
    @admin_user = User.find_by_admin(true)
    if @admin_user
      @articles = @admin_user.articles.visible.last(3)
      @works = @admin_user.portfolios.visible.last(3)
      @services = @admin_user.services.visible
    else
      @articles = []
      @works = []
      @services = []
    end
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if verify_recaptcha(model: @comment) && @contact.save
        # Tell ContactMailer to send a welcome email after save
        ContactMailer.contact_email(@contact).deliver
        # Tell ContactMailer to send the client message
        ContactMailer.client_message(@contact).deliver

        format.html { render action: :index }
        format.js { }
      else
        format.html { render action: :index }
        format.js { }
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
