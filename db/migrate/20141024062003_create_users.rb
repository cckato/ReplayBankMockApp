class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :unique_name
      t.string :mail
      t.string :name
      t.text :introduction
      t.string :image
      t.integer :birth_year

      t.timestamps
    end
  end
end
