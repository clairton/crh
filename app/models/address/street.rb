class Address::Street <  Address::Place
  validates_presence_of :address_place_id
  validates_associated :Neighborhood
end