class Taxe::Type < ActiveRecord::Base
  has_many :taxe_value, :class_name => "Taxe::Value", :dependent => :destroy, :foreign_key => "taxe_type_id"
  belongs_to :taxe_group, :class_name => "Taxe::Group", :foreign_key => "taxe_group_id"
  validates_uniqueness_of :code, :scope => :taxe_group_id
  validates_associated :taxe_group, :class_name => "Taxe::Group", :foreign_key => "taxe_group_id"
end

