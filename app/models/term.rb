class Term < ApplicationRecord
    has_and_belongs_to_many :sales

    default_scope { order(code: :asc) }
    scope :small, -> { where("code < 100") }
    scope :large, -> { where("code > 100") }

    def full_name
        if (I18n.locale == :zh and self.local_name? ) then
            self.local_name.truncate(60)
        else
            self.name.truncate(120)
        end
    end

    def to_label
        if (I18n.locale == :zh) then
            "#{code} : #{full_name} "
        else
            "#{code} : #{full_name}"
        end
    end
end
