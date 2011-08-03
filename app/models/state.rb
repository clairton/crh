class State < Place
  has_one :Country
  has_many :City
end
