module ApplicationHelper
  def display_date(date)
    return "--" unless date.present?
    I18n.l(date)
  end

  def translated_enum_options_for(object, options)
    object.class.send(options).map { 
      |_, option| 
        [ t("activerecord.attributes.#{object.model_name.i18n_key}.#{options}.#{option}"), 
          option
        ] 
      }
  end
end
