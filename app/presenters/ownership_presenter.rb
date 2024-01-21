class OwnershipPresenter < Keynote::Presenter
  presents :ownership

  def period
    "#{display_date(ownership.since_at)} -> #{display_date(ownership.until_at)} " +
    ", en #{I18n.t("activerecord.attributes.ownership.splittings.#{ownership.splitting}")}"
  end
end
