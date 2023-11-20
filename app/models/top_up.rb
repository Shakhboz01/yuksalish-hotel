class TopUp < ApplicationRecord
  include ShiftIsPresent
  belongs_to :booking
  validates :price, comparison: { greater_than: 0 }
end
