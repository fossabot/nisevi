class WelcomeController < ApplicationController
  def index
    @contact = Contact.new
    @admin_user = User.find_by_admin(true)
    @articles = @admin_user.articles.visible.last(3)
    @works = @admin_user.portfolios.last(3)
    @services = @admin_user.services.visible
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        # Tell ContactMailer to send a welcome email after save
        ContactMailer.contact_email(@contact).deliver
        # Tell ContactMailer to send the client message
        ContactMailer.client_message(@contact).deliver

        format.html redirect_to welcome_index_path(@contact)
        format.js
      else
        format.html redirect_to welcome_index_path(@contact)
        format.js
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
