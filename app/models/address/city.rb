class Address::City <  Address::Place
  validates_presence_of :address_place_id
  has_many :neighborhood, :class_name => "Address::neighborhood"
  #validates_associated :state, :class_name => "Address::state"
end

