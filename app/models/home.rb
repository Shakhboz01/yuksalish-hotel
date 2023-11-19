class Home < ApplicationRecord
  enum home_type: %i[hotel hostel]
  has_many :bookings

  def started_at
    self.bookings.where(finished_at: nil).last&.created_at
  end

  def number_of_guests
    self.bookings.where(finished_at: nil).last&.number_of_people
  end

  def breakfast_included
    self.bookings.where(finished_at: nil).last&.breakfast_included
  end

  def active?
    self.bookings.where(finished_at: nil).exists?
  end
end
