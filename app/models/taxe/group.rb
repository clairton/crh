class Taxe::Group < ActiveRecord::Base
  has_many :taxe_type, :class_name => "Taxe::Type", :foreign_key => "taxe_group_id", :dependent => :destroy
  validates_uniqueness_of :name
end

