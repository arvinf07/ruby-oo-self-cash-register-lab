require 'pry'

class CashRegister

  attr_accessor :total, :cart, :discount, :items, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @cart = []
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    @cart << [title, quantity, price]
    quantity.times {@items << title}
    @total += (quantity * price)
    @last_transaction = (quantity * price)
  end   

  def apply_discount
    if discount != nil
      discount = (@discount/100.0) * @total
      @total = @total - discount
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end  
  end  

  def items
    @items
  end  

  def void_last_transaction
    @total -= @last_transaction 
  end  
end
