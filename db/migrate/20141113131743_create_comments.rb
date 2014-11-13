class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
