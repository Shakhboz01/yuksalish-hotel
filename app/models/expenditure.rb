class Expenditure < ApplicationRecord
  include ShiftIsPresent
  belongs_to :user
  validates :price, comparison: { greater_than: 0 }
  enum expenditure_type: %i[зарплата аванс коммунальная_услуга откат магазин другие]
  after_create :send_message

  private

  def send_message
    message =
      "<b>Расход!</b>\n" \
      "Цена: #{number_to_currency(price)}\n" \
      "Тип оплаты: #{expenditure_type}"
    SendMessage.run(message: message)
  end
end
