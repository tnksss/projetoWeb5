class AddAdminToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :admin, :boolean, default: true
  end
end
