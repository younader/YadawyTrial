class Sellerinfo < ApplicationRecord
  belongs_to :seller
  validates  :first_name, :last_name,:address, :phone_number,:city, :gender, presence: true
  validates_numericality_of :phone_number
  validates_length_of :phone_number, minimum: 11 , maximum: 11
  enum gender: {
      "Male" => 0,
      "Female" => 1,

  }
end
