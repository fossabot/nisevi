# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['USERNAME_MAILER']
end

