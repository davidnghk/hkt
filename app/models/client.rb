class Client < ApplicationRecord
#  belongs_to :team, :optional => true
  has_rich_text :address
  
  has_many :assignments
  has_many :sales
  has_many :ship_sales, :class_name => "Sale", foreign_key: 'ship_client_id'
  has_many :tasks

  belongs_to :parent, :class_name => "Client", foreign_key: 'parent_id', :optional => true
  has_many :children, :class_name => "Client", foreign_key: 'parent_id', :dependent => :restrict_with_error
  
  default_scope { order(code: :asc) }

  before_create :set_codes 

  def to_label
    if self.parent_id?
      "#{code} : #{name} #{local_name} - #{site}"
    else
      "#{code} : #{name} #{local_name}"
    end 
  end

  def client_name
    if self.parent_id?
      self.parent.name 
    else
      self.name
    end 
  end

  def self.convert_address
    Client.all.each do |client|
      client.address = client.address1 if  client.address1?
      client.address += "\n"+cleint.address2 if  client.address2?
      client.address += "\n\n#{cleint.address3}" if  client.address3?
      client.address += "\n\n#{cleint.address4}" if  client.address4?
      client.save
    end 
  end

  def self.set_site
    Client.all.each do |client|
      client.site = "000"
      client.save
    end 
  end

  def set_codes

    if self.parent_id.nil?
      self.site = "000"
      cap = self.name[0..0]
      if Client.where(" code between ? and ? ", "#{cap}0000", "#{cap}9999").count > 0
        c = Client.where(" code between ? and ? ", "#{cap}0000", "#{cap}9999").order(:code).last
        last_code = c.code
        new_number = (last_code[1..4].to_i + 1)
        self.code = cap + ( "%04d" % new_number.to_s )
      else
        self.code = cap + "001"
      end
    else
      self.code = parent.code
      self.name = parent.name if self.name.nil? 
      self.local_name = parent.local_name if self.local_name.nil? 
      next_site = Client.where(code: parent.code).order(:site).last.site.to_i + 1
      self.site = "%03d" % next_site.to_s 
    end

  end

  def display_name
    "#{code} #{name} "
  end
 
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row| 
      Client.create! row.to_hash 
    end 
  end

end
