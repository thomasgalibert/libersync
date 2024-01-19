class CreateOwners < ActiveRecord::Migration[7.1]
  def change
    create_table :owners do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :status
      t.text :street
      t.string :zip
      t.string :town
      t.string :country
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
