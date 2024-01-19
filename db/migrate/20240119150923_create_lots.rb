class CreateLots < ActiveRecord::Migration[7.1]
  def change
    create_table :lots do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hoa, null: false, foreign_key: true
      t.integer :number
      t.text :description
      t.text :street
      t.string :zip
      t.string :town
      t.string :country
      t.integer :surface
      t.integer :shares

      t.timestamps
    end
  end
end
