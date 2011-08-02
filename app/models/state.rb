class State < Place
  has_one :Place
  has_one :Country
  has_many :City
  def initialize
    self.place_type_id = 2;
  end
end
