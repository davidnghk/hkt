class Ticket < ApplicationRecord
  belongs_to :notifiable, polymorphic: true

  # before_create :set_no 
  after_create_commit { TicketJob.perform_now self }

  belongs_to :user
  belongs_to :actor, :class_name => "User"

  scope :unread, ->{ where(read_at: nil) }
  scope :recent, ->{ order(created_at: :desc).limit(5) }

  private

  def set_no
    max_code = Ticket.maximum(:no)
    cur_year = Date.current.year - 2000 
    if max_code.to_i > cur_year * 10000
      self.no = max_code.to_i + 1
    else 
      self.no = cur_year * 100000 + 1
    end 
  end

end
