# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def welcome_email
    ContactMailer.contact_email(Contact.last)
  end

  def client_message
    ContactMailer.client_message(Contact.last)
  end
end
