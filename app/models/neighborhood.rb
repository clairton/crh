class Neighborhood <  Place
  validates_presence_of :place_id
  has_many :Street
  validates_associated :City
end
