class Taxe::Value < ActiveRecord::Base
	has_one :Taxe, :class_name => "Transaction::Taxe"
  has_one :Taxe, :class_name => "Transaction::Goods::Taxe"
	belongs_to :Type, :class_name => "Taxe::Type"
	validates_numericality_of :percentage
	validates_numericality_of :basis
	validates_numericality_of :value
	validates_associated :Type, :class_name => "Taxe::Type"
end
