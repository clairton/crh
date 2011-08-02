class City <  Place
  has_one :Place
  has_one :State
  has_many :Neighborhood
  def initialize
    self.place_type_id = 3;
  end
end
