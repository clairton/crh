class City <  Place
  validates_presence_of :place_id
  has_one :State
  has_many :Neighborhood
end
