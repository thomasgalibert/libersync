class LotPresenter < Keynote::Presenter
  presents :lot

  def address
    lot.street + ', ' + lot.zip + ' - ' + lot.town
  end
end
