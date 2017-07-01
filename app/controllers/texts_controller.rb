class TextsController < ApplicationController

  def new
    @phone = Phone.new
  end

  def send_text
    @phone = Phone.new(phone_params)
    TextWorker.perform_async(@phone.id)
    # render text: "MESSAGE HAS BEEN SCHEDULED TO BE SENT"
    redirect_to root_path
  end


  private
  def phone_params
    params.require(:phone).permit(:number)
  end
end
