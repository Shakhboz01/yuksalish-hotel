class TopUp < ApplicationRecord
  include ShiftIsPresent
  belongs_to :booking
  belongs_to :guest_info
  validates_presence_of :price
end
