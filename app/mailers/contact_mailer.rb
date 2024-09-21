class ContactMailer < ApplicationMailer
  def contact_email(name, phone, email, general_inquiry, message)
    @name = name
    @email = email
    @message = message
    @phone = phone
    @general_inquiry = general_inquiry

    #akshayrameshwar2020@gmail.com
    mail(to: 'rishabhjain072001@gmail.com', subject: 'New Contact Form Message', reply_to: email)
  end
end
  