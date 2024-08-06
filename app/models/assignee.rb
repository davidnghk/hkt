class Assignee < ApplicationRecord
  belongs_to :assignement
  belongs_to :team
end
