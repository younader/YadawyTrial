class SadminController < ApplicationController
  layout 'sadmin'
  before_action :set_product, only: [:listproducts]
  before_action :set_order, only: [:listorders]
  before_action :set_basics, only: [:index]


  before_action :authenticate_seller!
  def index

  end
  def listproducts

  end
def newproduct
  @product=Product.new
end
def listorders

end
def statistics

  end
  def revenue

  end


  private
  def set_product
    #sets the prodcut prior to conducting operations on the product
    @products =Product.where("seller_id = #{current_seller.id}")



  end
  def set_order
  #getting the ordered items

  temp=LineItem.joins(:order,:product)
    @line_items=temp.where("seller_id= #{current_seller.id}")
  end
  def set_basics
    #counts the number of products, of orders and the total revenue of the seller
    temp=LineItem.joins(:order,:product)
    @number_of_products =Product.where("seller_id = #{current_seller.id}").count
    rev=0
    LineItem.joins(:order,:product).each {|k| temp=Product.find("#{k[:product_id]}").price
    rev+= k[:quantity]*temp

    }
    @revenue=rev
    @num_orders= 0
    #result = ActiveRecord::Base.connection.exec_query("select gender, count(*) from (((buyerinfos INNER JOIN buyers on buyerinfos.buyer_id=buyers.id)INNER JOIN orders on orders.buyer_id = buyers.id)INNER JOIN line_items on line_items.order_id = orders.id AND buyers )where seller_id= #{current_seller.id} GROUP BY gender" )

  end
end
