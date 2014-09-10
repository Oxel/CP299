class ChangeTypeOfUserIdOnComments < ActiveRecord::Migration
	def change
  		remove_column :comments, :user_id
  		add_column :comments, :user_id, :integer
  		add_index :comments, :user_id
  	end
end
