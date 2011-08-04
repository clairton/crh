class City <  Place
  validates_presence_of :place_id
  has_many :Neighborhood
  validates_associated :State
end
