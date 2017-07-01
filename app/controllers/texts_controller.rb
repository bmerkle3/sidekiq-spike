class TextsController < ApplicationController

  def new
    @phone = Phone.new
  end

  def send_text
    @phone = Phone.new(phone_params)
    if @phone.save
      TextWorker.perform_async(@phone.id)
      # render text: "MESSAGE HAS BEEN SCHEDULED TO BE SENT"
      redirect_to root_path
    else
      redirect_to texts_new_path
    end
  end


  private
  def phone_params
    params.require(:phone).permit(:number)
  end
end
