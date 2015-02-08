class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email,  :unique => true
      t.string :username, :unique => true
      t.string :password
      t.string :reset_password_token, :unique => true
      t.string :password_confirmation
      t.string :phone
      t.timestamps
    end
  end
end
