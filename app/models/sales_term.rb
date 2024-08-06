class SalesTerm < ApplicationRecord
  belongs_to :sale
  belongs_to :term

  scope :by_code, order('terms.code').includes(:term)

end
