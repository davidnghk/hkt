class Line < ApplicationRecord
  belongs_to :lineable, polymorphic: true
  belongs_to :product

  has_many :things, as: :thingable

  default_scope { order(category: :asc, code: :asc) }

  before_create :set_description 
  before_save :set_price

  def actual_price
    if self.price?
      self.price
    else
      self.price = self.product.unit_rate * (1 - self.percentage/100.0) 
    end
  end

  def no_of_things
    self.things.count
  end

  private

  def set_price
    if self.price? 
      self.percentage = 0 
    end
  end

  def set_description
    if self.product.parent_id? 
      self.category = self.product.category
    end
    self.unit = self.product.unit_name
    self.code = self.product.code 
    self.method = self.product.local_name 
    self.description = self.product.name 
  end

  def code
    self.product.code
  end

end
