class Contact < ApplicationRecord
  # validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone_number
  validates_length_of :phone_number, is: 10
  validates_numericality_of :phone_number, only_integer: true

  # interface
  def name
    "#{first_name} #{last_name}"
  end
end
