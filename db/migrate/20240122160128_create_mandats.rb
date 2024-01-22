class CreateMandats < ActiveRecord::Migration[7.1]
  def change
    create_table :mandats do |t|
      t.references :hoa, null: false, foreign_key: true
      t.string :sexe
      t.string :name
      t.text :street
      t.string :zip
      t.string :town
      t.string :country
      t.string :email
      t.string :phone
      t.string :job
      t.date :since_at
      t.date :until_at

      t.timestamps
    end
  end
end
