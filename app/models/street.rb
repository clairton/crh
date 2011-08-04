class Street <  Place
  validates_presence_of :place_id
  #has_many :Address
  validates_associated :Neighborhood
end

