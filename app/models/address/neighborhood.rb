class Address::Neighborhood <  Address::Place
  validates_presence_of :address_place_id
  has_many :Street, :class_name => "Address::Street"
  #validates_associated :City, :class_name => "Address::City"
end