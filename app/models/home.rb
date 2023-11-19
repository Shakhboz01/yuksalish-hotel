class Home < ApplicationRecord
  after_initialize :say_hello
end
