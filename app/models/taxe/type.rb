class Taxe::Type < ActiveRecord::Base
  has_many :taxe_value, :class_name => "Taxe::Values"
  belongs_to :taxe_group, :class_name => "Taxe::Group"
  validates_uniqueness_of :code, :scope => :taxe_group_id
  validates_associated :group, :class_name => "Taxe::Group"
end

