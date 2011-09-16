class Address::Country < Address::Place
  has_many :address_state, :class_name => "Address::State"
  validates_uniqueness_of :name,:acronym
end
