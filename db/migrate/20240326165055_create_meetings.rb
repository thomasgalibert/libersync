class CreateMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :meetings do |t|
      t.belongs_to :hoa, null: false, foreign_key: true
      t.string :name
      t.datetime :start_time

      t.timestamps
    end
  end
end
