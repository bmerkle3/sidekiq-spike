class TextsController < ApplicationController

  def new
    @text = Text.new
  end

  def send_text
    @text = Text.new(text_params)
    from_time = Time.now
    to_time = DateTime.parse(@text.send_at.to_s)
    @send_in = helpers.distance_of_time_in_words(from_time, to_time)
    @text.send_at = to_time
    str = @text.to_s
    if @text.save
      # TextWorker.perform_in(5.minutes, @text.id)
      TextWorker.perform_async(@text.id)
      redirect_to root_path, :flash => { :success => str }
    else
      redirect_to texts_new_path
    end
  end


  private
  def text_params
    params.require(:text).permit(:number, :body, :description, :send_at)
  end
end


