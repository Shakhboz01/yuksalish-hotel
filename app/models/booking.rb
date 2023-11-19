class Booking < ApplicationRecord
  include ShiftIsPresent
  belongs_to :home
  validates_presence_of :number_of_people
  validates_presence_of :country
  after_create :notify_tg
  before_update :notify_tg_on_finish, if: :saved_changed_to_finished_at

  private

  def notify_tg
    SendMessage.run(message: "<h3>Оформлен прием гостей!</h3>\nКоличество гостей: #{number_of_people}\nНомер комнаты: #{home.number}")
  end

  def notify_tg_on_finish
    # TODO: add a total price info paid by booking
    # SendMessage.run(message: "<h3>Комната #{home.number} открыто!</h3>\nКоличество гостей: #{number_of_people}\nНомер комнаты: #{home.number}")
  end
end
