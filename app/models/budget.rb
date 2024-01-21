class Budget < ApplicationRecord
  include Monetizing
  belongs_to :user
  belongs_to :hoa
  has_many :payments

  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 2017 }
end
