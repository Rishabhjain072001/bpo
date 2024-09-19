class ContactMailer < ApplicationMailer
  default from: 'your_email@gmail.com'

  def contact_email(name, email, message)
    @name = name
    @message = message

    mail(to: 'rishabhjain072001@gmail.com', subject: 'New Contact Form Message', reply_to: email)
  end
end
  