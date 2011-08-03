class State < Place
  validates_presence_of :place_id
  has_one :Country
  has_many :City
end
