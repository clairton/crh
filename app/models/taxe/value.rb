class Taxe::Value < ActiveRecord::Base
	has_one :transaction_taxe, :class_name => "Transaction::Taxe"
  	has_one :transaction_goods_taxe, :class_name => "Transaction::Goods::Taxe"
	belongs_to :taxe_type, :class_name => "Taxe::Type"
	validates_numericality_of :percentage
	validates_numericality_of :basis
	validates_numericality_of :value
	validates_numericality_of :reduction
	validates_associated :taxe_type, :class_name => "Taxe::Type"
end
