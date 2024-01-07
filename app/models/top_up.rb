class TopUp < ApplicationRecord
  include ShiftIsPresent
  belongs_to :booking
  belongs_to :guest_info
  validates_presence_of :price
  enum payment_type: %i[наличные карта click другие]
end
