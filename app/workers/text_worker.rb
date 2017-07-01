class TextWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(text_id)
    text = Text.find(text_id)
    puts "SIDEKIQ WORKER SENDING A TEXT TO #{text.number}"
    text.send_sms(text.clean_number)
  end

end


# class TextWorker
#   include Sidekiq::Worker
#   sidekiq_options retry: false

#   def perform(phone_id)
#     phone = Phone.find(phone_id)
#     puts "SIDEKIQ WORKER SENDING A TEXT TO #{phone.number}"
#     phone.send_sms(phone.clean_number)
#   end

# end
