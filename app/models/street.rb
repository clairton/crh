class Street <  Place
  validates_presence_of :place_id
  has_one :Neighborhood
end
