class CreateBudgets < ActiveRecord::Migration[7.1]
  def change
    create_table :budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hoa, null: false, foreign_key: true
      t.integer :year
      t.integer :amount_cents

      t.timestamps
    end
  end
end
