class Address::State < Address::Place
  validates_presence_of :address_place_id
  has_many :address_city, :class_name => "Address::City"
  #validates_associated :Country, :class_name => "Address::Country"
end
