class Buyerinfo < ActiveRecord::Base
 # attr_accessor :phone, :fname, :lname, :address

  belongs_to :buyer
  validates :phone, :fname , :lname, :address , presence: true
  validates_numericality_of :phone

  validates_length_of :phone, minimum: 11 , maximum: 11
  enum gender: {
      "Male" => 0,
      "Female" => 1,

  }
end
