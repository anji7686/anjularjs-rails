class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :phone, :username, :password,  presence: true
	has_many :profiles, :dependent => :destroy
  	accepts_nested_attributes_for :profiles, allow_destroy: true, reject_if: :all_blank

	def as_json(options={})
    	super(:include => [:profiles])
  	end
end
