class OwnerPresenter < Keynote::Presenter
  presents :owner

  def address
    owner.street + ', ' + owner.zip + ' - ' + owner.town
  end
end
