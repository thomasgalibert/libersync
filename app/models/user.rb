# ---------------------------------
# t.string "email"
# t.string "name"
# t.datetime "last_sign_in_at"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# ---------------------------------

class User < ApplicationRecord

  validates :email, :name, presence: true
  validates :email, uniqueness: true
  normalizes :email, with: -> email { email.strip.downcase }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # virtual attribute for agreement checkbox
  attr_accessor :agreement
  validates :agreement, acceptance: true, on: :create

  generates_token_for :magic_login, expires_in: 15.minutes do
    last_sign_in_at
  end

  # Associations
  has_many :hoas, dependent: :destroy
  has_many :lots, through: :hoas
  has_many :owners, dependent: :destroy
  has_many :ownerships, through: :owners
end
