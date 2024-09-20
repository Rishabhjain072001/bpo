class PagesController < ApplicationController
  def home
    @wf_page_id = "5c167fe0dab57610cd77b794"
  end

  def services
    @wf_page_id = "5c167fe0dab576261f77b798"
  end

  def about_us
    @wf_page_id = "5c167fe0dab576137077b796"
  end

  def contact
    @wf_page_id = "5c167fe0dab5765d2977b797"
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
