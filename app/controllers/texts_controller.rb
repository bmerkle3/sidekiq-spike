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
    redirect_to root_path
  end


  private
  def phone_params
    params.require(:phone).permit(:number)
  end
end
