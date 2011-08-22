class Taxe::Value < ActiveRecord::Base
	belongs_to :Taxe, :class_name => "Transaction::Taxe"
	belongs_to :Type, :class_name => "Taxe::Type"
	validates_numericality_of :percentage
	validates_numericality_of :basis
	validates_numericality_of :value
end