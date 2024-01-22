class MandatPresenter < Keynote::Presenter
  presents :mandat

  def name
    "#{I18n.t("activerecord.attributes.mandat.sexes.#{mandat.sexe}")} #{mandat.name}"
  end

  def address
    mandat.street + ', ' + mandat.zip + ' - ' + mandat.town
  end

  def job
    "#{I18n.t("activerecord.attributes.mandat.jobs.#{mandat.job}")}"
  end
end
