class Container < ApplicationRecord

  belongs_to :collection

  has_many :things, as: :thingable, dependent: :delete_all

   before_update :saveThings

  def checkin_quantity
    self.things.where("code is not null").count
  end

  def checkedin
    self.quantity == self.checkin_quantity 
  end

  def saveThings
  	if self.tag_changed? and !self.tag.nil?
	  	self.tag.split(";").each do |tagcode|
	  		Thing.create(thingable: self, code: tagcode)
		end
	end
  end


end

 