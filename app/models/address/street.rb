class Address::Street <  Address::Place
  has_one :address ,:class_name => "Participant::Contact::address"
  validates_presence_of :address_place_id
  #validates_associated :neighborhood, :class_name => "Address:neighborhood"
end

