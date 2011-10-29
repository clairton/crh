class Address::Neighborhood <  Address::Place
  validates_presence_of :address_place_id
  has_many :street, :class_name => "Address::street"
  #validates_associated :city, :class_name => "Address::city"
end

