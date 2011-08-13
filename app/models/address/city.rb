class Address::City <  Address::Place
  validates_presence_of :address_place_id
  has_many :Neighborhood
  validates_associated :State
end