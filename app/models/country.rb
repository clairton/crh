class Country < Place
  has_many :State
  validates_uniqueness_of :name
end
