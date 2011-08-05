class Address::Neighborhood <  Address::Place
  validates_presence_of :address_place_id
  has_many :Street
  validates_associated :City
end

