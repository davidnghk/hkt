class Thing < ApplicationRecord
  belongs_to :thingable, polymorphic: true
  belongs_to :commodity, :optional => true

validates :mark, presence: true
validates_uniqueness_of :code, allow_nil: true

  # before_save :set_commodity

  def set_commodity 
    self.code = self.code.strip
    if Commodity.where("tag = ?", self.code).count > 0 
      @commodity = Commodity.where("tag = ?", self.code).first 
      self.commodity = @commodity
    end
  end

end
