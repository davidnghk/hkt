class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team

  enum role: { "Staff" => 0, "Manager" => 1, "Owner" => 2}

  attribute :email, :string
  validates_uniqueness_of :user_id, :scope => :team_id

  before_validation :set_user_id, if: :email?

  def set_user_id
  	existing_user = User.find_by(email: email)
	self.user = if existing_user.present?
			  		self.user = existing_user
			  	else
			  		self.user = User.invite!(email: email)
			  	end
  end

  def last_read
    last_read_at ||= Time.now()
  end
end
