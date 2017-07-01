class TextsController < ApplicationController
  # def index
  #   @phone = Phone.new
  # end

  def new
    @phone = Phone.new
  end

  def send_text
    @phone = Phone.new(phone_params)
    @phone.send_sms(@phone.clean_number)
    redirect_to :back
  end

  def send_text_message
    number_to_send_to = params[:number_to_send_to]

    twilio_sid = ENV['TWILIO_ID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = '+18722446988'

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "This is a message. It gets sent to #{number_to_send_to}"
    )
  end

  private
  def phone_params
    params.require(:phone).permit(:number)
  end
end
