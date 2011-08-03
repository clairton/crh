class Neighborhood <  Place
  validates_presence_of :place_id
  has_many :Street
  has_one :City
end
