class AddIndexToComments < ActiveRecord::Migration
  def change
    add_column :comments, :index, :string
  end
end
