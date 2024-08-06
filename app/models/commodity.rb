class Commodity < ApplicationRecord
  has_many :things, dependent: :delete_all

end
