class ContactMailer < ApplicationMailer
  def contact_email(message)
    @message = message
    mail(subject: 'New Contact Form Email from Website')
  end
end
