class Phone < ApplicationRecord

  def send_sms(number)
    acct_sid = ENV['TWILIO_ID']
    auth_token = ENV['TWILIO_TOKEN']

    @client = Twilio::REST::Client.new acct_sid, auth_token

    from = '+18722446988'

    message = @client.account.messages.create(
        from: from,
        to:   '+1'+ number,
        body: 'Work hard. Do good things. Change the world. sent to #{number}'
        )
  end

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end
end
