class Neighborhood <  Place
  has_one :Place
  has_many :Street
  def initialize
    self.place_type_id = 4;
  end
end
