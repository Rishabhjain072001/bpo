class ContactMailer < ApplicationMailer
  def contact_email(name, phone, email, general_inquiry, message)
    @name = name
    @email = email
    @message = message
    @phone = phone
    @general_inquiry = general_inquiry

    mail(to: 'countnine.solutions@gmail.com', subject: 'New Contact Form Message', reply_to: email)
  end
end
  