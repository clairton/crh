class Address::state < Address::place
  validates_presence_of :address_place_id
  has_many :city, :class_name => "Address::city"
  #validates_associated :country, :class_name => "Address::country"
end