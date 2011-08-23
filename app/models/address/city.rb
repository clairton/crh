class Address::City <  Address::Place
  validates_presence_of :address_place_id
  has_many :Neighborhood, :class_name => "Address::Neighborhood"
  #validates_associated :State, :class_name => "Address::State"
end