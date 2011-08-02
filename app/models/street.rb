class Street <  Place
  has_one :Place
  has_one :Neighborhood
  def initialize
    self.place_type_id = 5;
  end
end
