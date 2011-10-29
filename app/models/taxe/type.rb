class Taxe::Type < ActiveRecord::Base
  has_many :taxeValues, :class_name => "Taxe::Values", :foreign_key => "taxe_type_id", :dependent => :destroy
  belongs_to :taxeGroup, :class_name => "Taxe::Group", :foreign_key => "taxe_group_id"
  validates_uniqueness_of :code, :scope => :taxe_group_id
  validates_associated :taxeGroup, :class_name => "Taxe::Group", :foreign_key => "taxe_group_id"
end

