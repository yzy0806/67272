class Location < ActiveRecord::Base

	#before_save :get_geo_info
	#relationship
	has_many :camps

	#validations
	validates_presence_of :name, :street_1, :max_capacity, :zip
	validates_format_of :zip, with: /\A\d{5}\z/, message: "should be five digits long"

	validates_inclusion_of :state, in: %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY],message: "is not an option"

	validates_uniqueness_of :name, case_sensitive:false
	#Scope 

	scope :alphabetical, ->{order('name')}
	#order all the locations alphabetically
	scope :active, -> {where(active: true)}
	#Show all active locations
	scope :active, ->{where(active: false)}

	private
		def get_geo_info
		end
end

