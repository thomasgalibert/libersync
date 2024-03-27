class Meeting < ApplicationRecord
  belongs_to :hoa
  validates :name, :start_time, :days, presence: true
  has_rich_text :summary
  has_rich_text :location

  default_scope { order(start_time: :desc) }

  def pdf_name
    "ag_#{self.name}_#{self.hoa.name}.pdf"
  end
end
