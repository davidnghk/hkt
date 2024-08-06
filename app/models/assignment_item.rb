class AssignmentItem < ApplicationRecord
  belongs_to :assignment
  belongs_to :work_item

  enum rating: ["A", "B", "C", "N/A"]

end
