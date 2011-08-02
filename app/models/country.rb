class Country < Place
  has_one :Place
  has_many :State
  def initialize
    self.place_type_id = 1;
  end
end
