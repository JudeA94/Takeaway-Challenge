require 'twilio-ruby'

class Text
  def initialize
    @account_sid = ENV['ACC_SID_TWILIO']
    @auth_token = ENV['AUTH_TOKEN_TWILIO']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send(number)
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 20 * 60).strftime('%k:%M')}",
      to: "#{number}",
      from: "#{ENV['MY_TWILIO_NUMBER']}"
    )
    puts message.sid
  end
end
