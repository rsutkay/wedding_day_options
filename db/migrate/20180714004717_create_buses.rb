class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.boolean :need
      t.integer :user_id
      t.integer :passengers

      t.timestamps

    end
  end
end
