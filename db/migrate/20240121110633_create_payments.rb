class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :budget, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true
      t.references :lot, null: false, foreign_key: true
      t.date :paid_at
      t.string :method
      t.integer :amount_cents

      t.timestamps
    end
  end
end
