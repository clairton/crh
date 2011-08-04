class State < Place
  validates_presence_of :place_id
  has_many :City
  validates_associated :Country
end
