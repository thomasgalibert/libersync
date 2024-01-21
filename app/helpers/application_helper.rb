module ApplicationHelper
  def display_date(date)
    return "--" unless date.present?
    I18n.l(date)
  end
end
