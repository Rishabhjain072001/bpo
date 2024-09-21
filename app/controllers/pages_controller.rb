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
    if invalid_contact_details?
      render json: { success: false, message: "Validation fails" }, status: :unprocessable_entity
      return
    end

    begin
      ContactMailer.contact_email(
        contact_params[:name],
        contact_params[:phone],
        contact_params[:email],
        contact_params[:general_inquiry],
        contact_params[:message]
      ).deliver_now

      render json: { success: true, message: "Your message has been sent successfully." }, status: :ok
    rescue StandardError => e
      render json: { success: false, message: "Failed to send the message. Please try again later." }, status: :internal_server_error
    end
  end
  
  private
  
  def contact_params
    @contact_params ||= params.require(:fields).permit(:name, :phone, :email, :general_inquiry, :message, :authenticity_token)
  end
  
  def invalid_contact_details?
    if contact_params[:email].blank? || contact_params[:phone].blank? || !valid_email?(contact_params[:email])
      return true
    end
    false
  end

  def valid_email?(email)
    email =~ URI::MailTo::EMAIL_REGEXP
  end
end
