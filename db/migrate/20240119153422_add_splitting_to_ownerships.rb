class AddSplittingToOwnerships < ActiveRecord::Migration[7.1]
  def change
    add_column :ownerships, :splitting, :string
  end
end
