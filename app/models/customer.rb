class Customer
	include Mongoid::Document
	field :name, type: String
	field :email, type: String
	field :phone, type: String

	has_many :ramens

end
