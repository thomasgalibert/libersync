module PdfHelper

  def print_address(object, *args)
		options = args.extract_options!
		size = options[:size] || 9

		text object.name
  	text object.street, size: size, color: @gray
    text "#{object.zip} #{object.town}, #{object.country.upcase}", size: size, color: @gray
	end

  def logo(hoa)
    if hoa.logo.attached?
      logo_path = Rails.root.join('tmp', hoa.logo.filename.to_s)
      File.open(logo_path, 'wb') do |file|
        file.write(hoa.logo.download)
      end
      image logo_path, position: :right, height: 65
      File.delete(logo_path)
    end
  end

  def row_details(payment)
		[
      ["Date du paiement", display_date(payment.paid_at)],
      ["Moyen de paiement", I18n.t("activerecord.attributes.payment.means.#{payment.mean}")],
      ["Montant", number_to_currency(payment.amount)],
      ["Budget", "Année #{payment.budget.year}"]
    ]		
	end

  def print_footer(hoa)
    repeat(:all) do
      # Company name and VAT Number
      bounding_box [bounds.left, bounds.bottom + 34], width: bounds.width do
        stroke_horizontal_rule
   
        bounding_box([0, bounds.top-5], width: 575) do
          text "#{hoa.name} - #{hoa.street}, #{hoa.zip} - #{hoa.town}", align: :center, size: 7, color: "6C6C6C"
          text "Email : #{hoa.email} - Tel. #{hoa.phone}", size: 7, align: :center, color: "6C6C6C"
        end
        
      end
    end
    # Paging
    string = "<page> / <total>"
    options = { :at => [bounds.right - 150, 7],
                    :width => 150,
                    :align => :right,
                    :size => 7,
                    :start_count_at => 1}
    number_pages string, options
  end

  def president_name(hoa)
    president = hoa.president
    president.present? ? "#{I18n.t("activerecord.attributes.mandat.sexes.#{president.sexe}")} #{president.name}" : "Président non défini"
  end

  def president_signature(hoa)
    president = hoa.president

    if president.present? && president.signature.attached?
      signature_path = Rails.root.join('tmp', president.signature.filename.to_s)
      File.open(signature_path, 'wb') do |file|
        file.write(president.signature.download)
      end
      image signature_path, position: :left, height: 65
      File.delete(signature_path)
    end
  end
end