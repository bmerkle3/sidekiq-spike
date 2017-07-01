class TextsController < ApplicationController

  def new
    @text = Text.new
  end

  def send_text
    @text = Text.new(text_params)
    if @text.save
      # TextWorker.perform_in(5.minutes, @text.id)
      TextWorker.perform_async(@text.id)

      # render text: "MESSAGE HAS BEEN SCHEDULED TO BE SENT"
      redirect_to root_path
    else
      redirect_to texts_new_path
    end
  end


  private
  def text_params
    params.require(:text).permit(:number, :body, :description, :send_at)
  end
end

# class TextsController < ApplicationController

#   def new
#     @phone = Phone.new
#   end

#   def send_text
#     @phone = Phone.new(phone_params)
#     if @phone.save
#       TextWorker.perform_in(5.minutes, @phone.id)
#       # render text: "MESSAGE HAS BEEN SCHEDULED TO BE SENT"
#       redirect_to root_path
#     else
#       redirect_to texts_new_path
#     end
#   end


#   private
#   def phone_params
#     params.require(:phone).permit(:number)
#   end
# end

