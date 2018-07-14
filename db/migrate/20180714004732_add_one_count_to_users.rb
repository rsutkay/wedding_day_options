class AddOneCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ones_count, :integer
  end
end
