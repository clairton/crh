class Address::State < Address::Place
  validates_presence_of :address_place_id
  has_many :City
  validates_associated :Country
end