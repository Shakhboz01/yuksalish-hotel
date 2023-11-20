class Expenditure < ApplicationRecord
  include ShiftIsPresent
  belongs_to :user
  validates :price, comparison: { greater_than: 0 }
  enum expenditure_type: %i[на_завтрак зарплата аванс коммунальная_услуга транспорт другие]
end
