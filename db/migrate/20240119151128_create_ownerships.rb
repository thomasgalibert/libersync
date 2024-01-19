class CreateOwnerships < ActiveRecord::Migration[7.1]
  def change
    create_table :ownerships do |t|
      t.references :owner, null: false, foreign_key: true
      t.references :lot, null: false, foreign_key: true
      t.date :since_at
      t.date :until_at

      t.timestamps
    end
  end
end
