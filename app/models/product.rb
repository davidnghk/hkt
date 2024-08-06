class Product < ApplicationRecord
    # has_ancestry 
    #has_rich_text :description 

    belongs_to :parent, :class_name => "Product", :optional => true
    belongs_to :unit_type, :class_name => "Master", foreign_key: "unit_type_id", :optional => true
    has_many :children, :class_name => "Product", foreign_key: 'parent_id' 
    has_many :lines 
    has_many :sales, through: :lines

    default_scope { order(code: :asc) }
    scope :Category, -> { where(parent_id: nil) }
    scope :Service, -> { where("parent_id > 0") }

    before_save :set_category

    def to_label
        "#{code}  #{name} - #{local_name} "
    end
  
    def category
        if self.parent_id? 
            parent.name
        end
    end

    def display_name
        "#{code} #{local_name}"
    end

    def set_category
        if !self.parent_id and category_name?
            @category = Product.where("name = ?", self.category_name).first
            self.parent = @category
        end

    end

    def amount
        self.sale_items.price 
    end

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row| 
          Product.create! row.to_hash 
        end 
    end

end
