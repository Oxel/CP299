class AddAvatarToUSers < ActiveRecord::Migration
  def change
    add_column :u_sers, :avatar, :string
  end
end
