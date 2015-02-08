class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
	    t.string :address1
      t.string :address2
      t.string :address3
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :mobile
      t.string :location
      t.string :zipcode
      t.integer :user_id
      t.timestamps
    end
  end
end
