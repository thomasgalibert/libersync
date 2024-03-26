class Meeting < ApplicationRecord
  belongs_to :hoa
  validates :name, :start_time, presence: true
  has_rich_text :summary

  default_scope { order(start_time: :desc) }
end
