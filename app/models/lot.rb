class Lot < ApplicationRecord
  belongs_to :user
  belongs_to :hoa
  has_many :ownerships, dependent: :destroy
  has_many :owners, through: :ownerships
  has_many :payments

  validates :number, presence: true, uniqueness: { scope: :hoa_id }
  validates :street, :zip, :town, :country, presence: true

  default_scope { order(number: :asc) }

  def long_name
    "Lot N° #{self.number}"
  end
end
