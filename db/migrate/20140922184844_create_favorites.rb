class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.text :post
      t.string :user

      t.timestamps
    end
  end
end
