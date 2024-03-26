# t.integer "user_id", null: false
# t.string "name"
# t.text "street"
# t.string "zip"
# t.string "town"
# t.string "country"
# t.string "email"
# t.string "phone"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["user_id"], name: "index_hoas_on_user_id"

class Hoa < ApplicationRecord
  belongs_to :user
  has_many :lots, dependent: :destroy
  has_many :owners, through: :lots
  has_many :mandats, dependent: :destroy
  has_many :meetings, dependent: :destroy
  default_scope { order(:name) }

  validates :name, :street, :zip, :town, :country, presence: true

  has_one_attached :logo

  def president
    self.mandats.presidents.actives.first
  end

end
