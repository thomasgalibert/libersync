class Lot < ApplicationRecord
  belongs_to :user
  belongs_to :hoa
  has_many :ownerships, dependent: :destroy
  has_many :owners, through: :ownerships

  validates :number, presence: true, uniqueness: { scope: :hoa_id }
  validates :street, :zip, :town, :country, presence: true

  default_scope { order(number: :asc) }
end
