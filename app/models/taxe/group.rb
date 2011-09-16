class Taxe::Group < ActiveRecord::Base
  has_many :taxe_type, :class_name => "Taxe::Type"
  validates_uniqueness_of :name
end

