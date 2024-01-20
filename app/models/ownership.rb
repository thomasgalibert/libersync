class Ownership < ApplicationRecord
  belongs_to :owner
  belongs_to :lot
  enum :splitting, full: "full", splitted: "splitted"
end
