require "open-uri"
include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::NumberHelper
include ApplicationHelper
include PdfHelper

class MeetingPdf < Prawn::Document
  def initialize(meeting)
		# --------------- General parameters --------------
		# 595 × 842 points
		# availables 575 x 822 | Mid 280 (15 gutter)
    super(top_margin: 10, bottom_margin: 10, left_margin: 40, right_margin: 40, page_size: "A4")
    self.font_families.update("OpenSans" => {
      :normal => Rails.root.join("vendor/assets/fonts/Open_Sans/OpenSans-Regular.ttf"),
      :italic => Rails.root.join("vendor/assets/fonts/Open_Sans/OpenSans-Italic.ttf"),
      :bold => Rails.root.join("vendor/assets/fonts/Open_Sans/OpenSans-Bold.ttf"),
      :bold_italic => Rails.root.join("vendor/assets/fonts/Open_Sans/OpenSans-BoldItalic.ttf")
    })
    font "OpenSans"
    @meeting = meeting
    @hoa = @meeting.hoa
    @header_width_left = 250
    @header_width_right = 295
    @header_offset = 280
    @gray = "475569"

    # --------------- PDF CONTENT --------------------
    print_sender
    print_logo
    print_title
    print_date
    print_introduction
    print_summary
    print_closing
    print_signature
    # new page
    start_new_page
    print_pouvoir
    print_footer(@hoa)
  end

  def print_sender
    bounding_box([0, 822], width: @header_width_left-60, height: 95) do
      # transparent(0.5) { stroke_bounds }
      move_down 5
      print_address(@hoa)
      text "Association syndicale libre enregistrée", size: 9, color: @gray
    end
  end

  def print_logo
    bounding_box([430, 822], width: 80) do
      logo(@hoa)
    end
  end

  def print_title
    move_down 20
    stroke_horizontal_rule
  	move_down 5
  	text "Convocation à #{@meeting.name} de l'Association Syndicale Libre #{@hoa.name}", align: :center, size: 12
  	move_down 5
  	stroke_horizontal_rule
  end

  def print_date
    move_down 20
    text "Le #{I18n.l(Date.today)} à #{@hoa.town}", align: :right, size: 10
  end

  def print_introduction
    move_down 20
    text "Madame, Monsieur", size: 10
    move_down 15
    text "En qualité de président de l'Association Syndicale Libre #{@hoa.name}, j'ai l'honneur de vous convoquer à #{@meeting.name} qui se tiendra le #{I18n.l(@meeting.start_time, format: :short)}, à l'adresse suivante :", size: 10, align: :justify
    move_down 15
    text sanitize(@meeting.location.to_plain_text), size: 10, align: :justify, style: :bold
  end

  def print_summary
    move_down 15
    text "Ordre du jour :", size: 12, style: :bold
    move_down 15
    text sanitize(@meeting.summary.to_plain_text), size: 10, align: :justify
  end

  def print_closing
    move_down 15
    text "Il est important que chaque membre participe à cette assemblée afin d'exprimer ses votes et avis concernant les divers points à l'ordre du jour. Votre présence est donc essentielle.", size: 10, align: :justify
    move_down 15
    text "Conformément à nos statuts, si vous ne pouvez pas assister personnellement à l'assemblée, vous avez la possibilité de vous faire représenter par un autre membre de l'association muni d'un pouvoir régulièrement établi. Vous trouverez ci-joint un modèle de pouvoir à compléter si nécessaire.", size: 10, align: :justify
    move_down 15
    text "Nous vous rappelons également que, pour être pris en compte, tout point ou question que vous souhaiteriez voir inscrire à l'ordre du jour de cette assemblée doit nous être transmis au moins #{@meeting.days} jours avant la date de l'assemblée.", size: 10, align: :justify
    move_down 15
    text "Dans l'attente du plaisir de vous rencontrer lors de cette assemblée, veuillez agréer, Madame, Monsieur, l'expression de nos salutations distinguées.", size: 10, align: :justify
  end

  def print_signature
    bounding_box([@header_offset+80, y-50], width: @header_width_right, height: 110) do
      # transparent(0.5) { stroke_bounds }
      text "le Président de l'ASL", size: 9, color: @gray
      text president_name(@hoa), size: 9, color: @gray
      move_down 5
      president_signature(@hoa)
    end
  end

  def print_pouvoir
    move_down 20
    text "POUVOIR DE RÉPRESENTATION", align: :center, size: 12
    move_down 5
    text "à #{@meeting.name} de l'association #{@hoa.name}", align: :center, size: 10
    move_down 10
    stroke_horizontal_rule
  	move_down 25
    text "Je soussigné(e) Mme/M. ......................................................................, membre de l'Association Syndicale Libre #{@hoa.name}, donne par la présente pouvoir au membre désigné ci-après :", size: 10
    move_down 15
    text "Nom et prénom du membre désigné :", size: 10
    move_down 5
    text "Mme/M. ......................................................................................., demeurant au .............................................................................................................................................................................", size: 10
    move_down 5
    text "afin de me représenter et de voter en mon nom lors de l'assemblée générale de l'association qui se tiendra le #{I18n.l(@meeting.start_time, format: :short)} à l'adresse suivante :", size: 10
    move_down 15
    text sanitize(@meeting.location.to_plain_text), size: 10, style: :bold
    move_down 15
    text "Pour valoir ce que de droit.", size: 10
    move_down 15
    text "Fait à .........................., le ..........................", size: 10
    move_down 15
    text "Signature du mandant", size: 10
    move_down 45
    text "Signature du mandataire", size: 10
  end

end