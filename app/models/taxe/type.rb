class Taxe::Type < ActiveRecord::Base
  has_many :Values, :class_name => "Taxe::Values"
  belongs_to :Group, :class_name => "Taxe::Group"
  validates_uniqueness_of :code, :scope => :taxe_group_id
  validates_associated :Group, :class_name => "Taxe::Group"
end

