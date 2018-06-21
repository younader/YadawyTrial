class Product < ActiveRecord::Base
  attr_accessor :image


  belongs_to :seller
  has_many :line_items
  has_many :comments, as: :commentable
  #defining action to do before the deletion of a product by a seller
  before_destroy :ensure_not_referenced_by_any_line_item
  #adds image uploader to the model
  mount_uploader :image, ImageUploader
  validates :price,:name , presence: true
  #validates that price is a number
  validates_numericality_of :price

  enum type: {
      "Accessory" => 0,
      "Sewing" => 1,
      "Cooking" => 2,


  }
  #makes sure there are no current orders of the item wanted to be deleted
private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
       errors.add(:base, 'Line Items present')
       throw :abort
       end
  end
end



