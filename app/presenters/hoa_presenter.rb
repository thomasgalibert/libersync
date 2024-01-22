class HoaPresenter < Keynote::Presenter
  presents :hoa

  def logo
    if hoa.logo.attached?
      content_tag(:div, image_tag(hoa.logo.representation(resize_to_limit: [500, 500]), class: "mx-auto size-32 rounded-xl shadow-sm"))
    else
      content_tag(:div, "", class: "mx-auto size-32 bg-slate-500 rounded-xl shadow-sm")
    end
  end
end
