class Taxe::Group < ActiveRecord::Base
  has_many :taxeType, :class_name => "Taxe::Type", :foreign_key => "taxe_type_id", :dependent => :destroy
  validates_uniqueness_of :name
end

