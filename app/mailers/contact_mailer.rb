# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'Welcome to my site.')
  end

  def client_message(contact)
    @contact = contact
    mail(from: @contact.email, to: ENV['USERNAME_MAILER'], subject: 'Client message.')
  end
end
