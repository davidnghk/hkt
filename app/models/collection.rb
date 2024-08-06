class Collection < ApplicationRecord

    has_many :containers, dependent: :delete_all
    has_many :things, through: :containers

    enum status: { open: 0, close: 1 }

    def self.import(file)
        current_request_ref_no = ""
        CSV.foreach(file.path, headers: true) do |row| 
          if Collection.where(request_ref: row["request_ref"], customer_contract_no: row["customer_contract_no"] ).count == 0
            Collection.create!([
              {request_ref: row["request_ref"],
                received_date: row["received_date"],
                customer_contract_no: row["customer_contract_no"],
                request_ref: row["request_ref"],
                location: row["location"],
              },
            ])
          end
    
          collection = Collection.where(request_ref: row["request_ref"], customer_contract_no: row["customer_contract_no"] ).first
          if Container.where(collection_id: collection.id, code: row["request_ref_no"] ).count == 0
            Container.create!([
              {collection_id: collection.id,
                code: row["request_ref_no"],
                object: row["type"],
                size: row["size"],
                quantity: 1,
              }
            ])
          else
            container = Container.where(collection_id: collection.id, code: row["request_ref_no"] ).first
            container.quantity = container.quantity + 1 
            container.save
          end

          container = Container.where(collection_id: collection.id, code: row["request_ref_no"] ).first
          Thing.create!([
            {thingable_type: "Container",
             thingable_id: container.id,
             set_no: row["set_no"],
             mark: row["cube_mark"],
            }
          ])          
        end 
      end

    def to_label
      "#{customer_contract_no} #{request_ref}"
    end

    def number_of_sets 
      self.containers.count 
    end


end
