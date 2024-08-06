class Folder < ApplicationRecord
  has_one_attached :uploadfile
  belongs_to :foldable, polymorphic: true
end

