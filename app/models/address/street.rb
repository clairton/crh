class Address::Street <  Address::Place
  has_one :participant_contact_address ,:class_name => "Participant::Contact::Address"
  validates_presence_of :address_place_id
  #validates_associated :Neighborhood, :class_name => "Address:Neighborhood"
end
