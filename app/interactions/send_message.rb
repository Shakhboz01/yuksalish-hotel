require "telegram/bot"

class SendMessage < ActiveInteraction::Base
  string :message

  def execute
    token = ENV["TELEGRAM_TOKEN"]
    bot = Telegram::Bot::Client.new(token)
    begin
      bot.api.send_message(chat_id: ENV["TELEGRAM_CHAT_ID"], text: message)
    rescue => exception
      Rails.logger.warn "telegram error"
    end
  end
end
