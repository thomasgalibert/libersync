class Owner < ApplicationRecord
  belongs_to :user
  has_many :ownerships, dependent: :destroy
  has_many :lots, through: :ownerships

  validates :name, presence: true, uniqueness: { scope: :user_id }

  enum :status, moral: "moral", physical: "physical", indivision: "indivision"
end
