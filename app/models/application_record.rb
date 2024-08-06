class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.translate_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  def self.translate_enum_collection(enum_name)
    enum_values = self.send(enum_name.to_s.pluralize).keys
    enum_values.map do |enum_value|
      self.translate_enum_name enum_name, enum_value
    end
  end

  def self.to_label
      if (I18n.locale == :zh) then
          "#{self.local_name}"
      else
          "#{self.name}"
      end
  end

  def display_name
    if (I18n.locale == :zh) then
        "#{self.local_name}"
    else
        "#{self.name}"
    end
  end

end
