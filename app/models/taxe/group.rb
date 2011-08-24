class Taxe::Group < ActiveRecord::Base
  has_many :Type, :class_name => "Taxe::Type"
  validates_uniqueness_of :name
end

