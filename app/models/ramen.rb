class Ramen
  include Mongoid::Document
  field :noodles, type: String
  field :broth, type: String
  field :spicy, type: String
  field :egg, type: Mongoid::Boolean
  field :bean_sprouts, type: Mongoid::Boolean
  field :mushrooms, type: Mongoid::Boolean
  field :broccoli, type: Mongoid::Boolean
  field :corn, type: Mongoid::Boolean
  field :spicy_miso, type: Mongoid::Boolean
  field :extra_pork, type: Mongoid::Boolean

belongs_to :customer
end
