class Site < ApplicationRecord
  belongs_to :client
  has_many :assignments

  default_scope { order(code: :asc) }

  def to_label
    if (I18n.locale == :zh) then
        "#{local_name}"
    else
        "#{name}"
    end
  end

  def display_name
    if (I18n.locale == :zh) then
      "#{local_name}"
    else
      "#{name}"
    end
  end

end
