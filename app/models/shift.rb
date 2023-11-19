class Shift < ApplicationRecord
  belongs_to :user
  before_create :check_unclosed_shifts
  after_create :send_creation_message
  before_update :send_closed_message, if: :saved_changed_to_closed_at

  scope :unclosed, -> { where(closed_at: nil) }

  private

  def check_unclosed_shifts
    shift = Shift.unclosed
    return if shift.empty?

    errors.add(:base, "Перед тем как создать новую смену, вам необходимо закрыть другие смены")
  end

  def send_creation_message
    SendMessage.run(message: "<h3>Смена открыт</h3>\n")
  end

  def send_closed_message
    expenditures = Expenditure.where("created_at > ?", created_at).sum(:price)
    incomes = TopUp.where("created_at > ?", created_at).sum(:price)
    self.total_expenditure = expenditures
    self.total_income = incomes
    SendMessage.run(message: "<h3>Смена закрыт</h3>\n" \
                             "Итого приход: 0 сум \n" \
                             "Итого расход: 0 сум")
  end
end
