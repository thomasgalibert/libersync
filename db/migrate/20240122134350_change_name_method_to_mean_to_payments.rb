class ChangeNameMethodToMeanToPayments < ActiveRecord::Migration[7.1]
  def change
    rename_column :payments, :method, :mean
  end
end
