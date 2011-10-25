class Address::country < Address::place
  has_many :state, :class_name => "Address::state"
  validates_uniqueness_of :name,:acronym
end