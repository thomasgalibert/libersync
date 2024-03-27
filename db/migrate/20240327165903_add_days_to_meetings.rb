class AddDaysToMeetings < ActiveRecord::Migration[7.1]
  def change
    add_column :meetings, :days, :integer
  end
end
