class ApplicationMailer < ActionMailer::Base
  default from: ENV["USERNAME_MAILER"]
end

