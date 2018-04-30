# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @contact = Contact.new
    @admin = User.find_by_admin(:true)
    @publications = @admin.publications
  end

  def create
    @contact = Contact.new(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
      render :index, notice: 'Thank you, your message was delivered.'
    else
      render :index, alert: 'Sorry, your message was not delivered.'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
