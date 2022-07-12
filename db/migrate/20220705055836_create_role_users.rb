class CreateRoleUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :role_users do |t|
      t.string :rolename

      t.timestamps
    end
  end
end
