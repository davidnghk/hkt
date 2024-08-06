class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :work_item

  def amount
    if quantity? 
      self.price * self.quantity 
    end 
  end

end
