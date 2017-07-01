class TextWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(phone_id)
    phone = Phone.find(phone_id)
    puts "SIDEKIQ WORKER SENDING A TEXT TO #{number}"
    phone.send_sms(phone.clean_number)
  end

end
