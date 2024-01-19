class Owner < ApplicationRecord
  belongs_to :user
  has_many :ownerships, dependent: :destroy
  has_many :owners, through: :ownerships

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
