class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :introduction
      t.string :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
