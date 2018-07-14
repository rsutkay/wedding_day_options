class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id

      t.timestamps

    end
  end
end
