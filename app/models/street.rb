class Street <  Place
  validates_presence_of :place_id
  has_and_belongs_to_many :Adress, :class_name => "Adress"
  validates_associated :Neighborhood
end
