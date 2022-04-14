class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
  
    change_table :users do |t|
      t.string :role, default: 'user', null: false
    end
  end
end
