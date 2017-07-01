class MessagesController < ApplicationController
  # skip_before_filter :verify_authenticity_token

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new, status: 422
    end
  end

  # def reply
  #   message_body = params["Body"]
  #   from_number = params["From"]
  #   boot_twilio
  #   sms = @client.messages.create(
  #     from: Rails.application.secrets.twilio_number,
  #     to: from_number,
  #     body: "hello there, thanks for texting me. Your number is #{from_number}"
  #     )
  # end

  private

  # def boot_twilio
  #   account_sid = Rails.application.secrets.twilio_sid
  #   auth_token = Rails.application.secrets.twilio_token
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  # end

  def message_params
    params.require(:message).permit(:text)
  end

end
