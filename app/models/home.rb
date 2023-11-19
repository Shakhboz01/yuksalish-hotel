class Home < ApplicationRecord
  after_initialize :say_hello
  enum home_type: %i[hotel hostel]
end
