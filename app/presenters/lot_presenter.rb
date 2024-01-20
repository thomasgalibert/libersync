class LotPresenter < Keynote::Presenter
  presents :lot

  def address
    lot.street + ', ' + lot.zip + ' - ' + lot.town
  end

  def name
    "Lot N° #{lot.number} - #{lot.hoa.name}"
  end
end
