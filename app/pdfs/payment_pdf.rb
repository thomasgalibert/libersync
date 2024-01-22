require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/prawn_outputter'
require "open-uri"
include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::NumberHelper
include ApplicationHelper
include PdfHelper

class PaymentPdf < Prawn::Document
  def initialize(payment)
		# --------------- General parameters --------------
		# 595 × 842 points
		# availables 575 x 822 | Mid 280 (15 gutter)
    super(top_margin: 10, bottom_margin: 10, left_margin: 10, right_margin: 10, page_size: "A4")
    self.font_families.update("OpenSans" => {
      :normal => Rails.root.join("vendor/assets/fonts/Open_Sans/OpenSans-Regular.ttf"),
      :italic => Rails.root.join("vendor/assets/fonts/Open_Sans/OpenSans-Italic.ttf"),
      :bold => Rails.root.join("vendor/assets/fonts/Open_Sans/OpenSans-Bold.ttf"),
      :bold_italic => Rails.root.join("vendor/assets/fonts/Open_Sans/OpenSans-BoldItalic.ttf")
    })
    font "OpenSans"
    @payment = payment
    @hoa = @payment.budget.hoa
    @header_width_left = 250
    @header_width_right = 295
    @header_offset = 280
    @gray = "475569"

    # --------------- PDF CONTENT --------------------
    print_barcode
    print_kind
    print_sender
    print_logo
    print_details
    print_receiver
    print_title
    print_content
    print_signature
    print_footer(@hoa)
  end

  def print_barcode
  	bounding_box([@header_offset, 822], width: @header_width_right, height: 30) do
      # transparent(0.5) { stroke_bounds }
      barcode = Barby::Code128B.new(@payment.barcode_input) 
  		barcode.annotate_pdf(self, xdim: 2)
    end
  end

  def print_kind
  	bounding_box([@header_offset, 782], width: @header_width_right, height: 50) do
      transparent(0.5) { stroke_bounds }
      stroke do
        stroke_color '000000'
        fill_color '000000'
        fill_and_stroke_rounded_rectangle [cursor-50,cursor], @header_width_right, 50, 0
        fill_color '000000'
    	end
    	pad_top(10) { text "Reçu de paiement", size: 20, align: :center, color: 'FFFFFF' }
    end
  end

  def print_sender
    bounding_box([0, 822], width: @header_width_left-60, height: 95) do
      # transparent(0.5) { stroke_bounds }
      text "document émis par :", size: 9, color: @gray
      move_down 5
      print_address(@hoa)
      text "Association syndicale libre enregistrée", size: 9, color: @gray
    end
  end

  def print_logo
    bounding_box([@header_width_left-70, 822], width: 80) do
      logo(@hoa)
    end
  end

  def print_details
  	bounding_box([0, 717], width: @header_width_left, height: 120) do
      # transparent(0.5) { stroke_bounds }
      table row_details(@payment), column_widths: [150, 100], cell_style: {border_width: 0.5} do
      	row(0..5).size = 9
        row(0..5).padding = 4
        columns(1).align = :right
        columns(0..1).font = "Courier"
      end
    end
  end

  def print_receiver
  	bounding_box([@header_offset, 722], width: @header_width_right, height: 110) do
      # transparent(0.5) { stroke_bounds }
      text "Paiement effectué par :", size: 9, color: @gray
      move_down 5
      print_address(@payment.owner, size: 10)
    end
  end

  def print_title
  	stroke_horizontal_rule
  	move_down 5
  	text "Reçu de paiement de cotisation à l'ASL #{@hoa.name}", align: :center, size: 12
  	move_down 5
  	stroke_horizontal_rule
  end

  def print_content
    move_down 50
    text "Le présent document atteste que #{@payment.owner.name} a effectué un paiement de #{number_to_currency(@payment.amount)} en date du #{display_date(@payment.paid_at)} au titre de sa contribution au budget #{@payment.budget.year} de l'ASL #{@hoa.name} pour le lot #{@payment.lot.number}.", size: 12, align: :justify
    move_down 20
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
end