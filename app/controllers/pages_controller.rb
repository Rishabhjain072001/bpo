class PagesController < ApplicationController
  def home
  end

  def services
  end

  def about_us
  end

  def contact
  end

  def send_email
    name = params[:name]
    email = params[:email]
    message = params[:message]

    # Send the email
    ContactMailer.contact_email(name, email, message).deliver_now

    # Redirect to a "Thank you" page or back to the contact page
    redirect_to contact_path, notice: 'Thank you for your message. We will get back to you shortly.'
  end
end
