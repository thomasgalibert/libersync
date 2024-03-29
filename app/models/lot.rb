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

  def owner_at_name(date)
    ownership = self.owner_at(date)
    if ownership
      ownership.owner.name
    else
      "N/A"
    end
  end

  def owner_at(date)
    ownership = self.ownerships
      .where("since_at <= ?", date)
      .where("until_at >= ? OR until_at IS NULL", date)
      .order(since_at: :desc).first
  end
end
