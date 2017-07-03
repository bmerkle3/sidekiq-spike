class TextWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(text_id)
    @text = Text.find(text_id)
    puts "SIDEKIQ WORKER SENDING A TEXT TO #{@text.number}"
    @text.send_sms(@text.clean_number, @text)
  end
end

