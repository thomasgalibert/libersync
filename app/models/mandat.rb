class Mandat < ApplicationRecord
  belongs_to :hoa
  has_one_attached :signature

  validates :sexe, :name, :street, :zip, :town, :country, presence: true

  enum :sexe, male: "male", female: "female", company: "company"
  enum :job, president: "president", treasurer: "treasurer", secretary: "secretary"

  default_scope { order(since_at: :desc) }
  scope :presidents, -> { where(job: "president") }
  scope :actives, -> { where(until_at: nil) }
end
