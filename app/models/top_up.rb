class TopUp < ApplicationRecord
  include ShiftIsPresent
  belongs_to :booking
  validates_presence_of :price
end
