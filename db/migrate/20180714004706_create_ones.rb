class CreateOnes < ActiveRecord::Migration
  def change
    create_table :ones do |t|
      t.integer :user_id
      t.string :name

      t.timestamps

    end
  end
end
