class Address::Country < Address::Place
  has_many :State
  validates_uniqueness_of :name,:acronym
end

