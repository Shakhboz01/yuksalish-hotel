class Shift < ApplicationRecord
  belongs_to :user
  before_create :check_unclosed_shifts
  before_update :send_closed_message
  after_create :send_creation_message

  scope :unclosed, -> { where(closed_at: nil) }

  private

  def check_unclosed_shifts
    shift = Shift.unclosed
    return if shift.empty?

    errors.add(:base, "Перед тем как создать новую смену, вам необходимо закрыть другие смены")
  end

  def send_creation_message
    SendMessage.run!(message: "<b>СМЕНА ОТКРЫТ</b>\n")
  end

  def send_closed_message
    expenditures = Expenditure.where("created_at > ?", created_at).sum(:price)
    incomes = TopUp.where("created_at > ?", created_at).sum(:price)
    self.total_expenditure = expenditures
    self.total_income = incomes
    self.closed_at = DateTime.current
    SendMessage.run!(message: "<b>Смена закрыт</b>\n" \
                     "Открылся в: #{created_at.strftime("%Y-%m-%d %H:%M")}\n" \
                     "Закрылся в: #{closed_at.strftime("%Y-%m-%d %H:%M")}\n" \
                     "Итого приход: #{incomes} сум\n" \
                     "Итого расход: #{total_expenditure} сум")
  end
end
