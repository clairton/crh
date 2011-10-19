class Taxe::Value < ActiveRecord::Base
  has_one :transactionTaxe, :class_name => "Transaction::Taxe", :dependent => :destroy , :foreign_key => "taxe_value_id"
  has_one :Taxe, :class_name => "Transaction::Goods::Taxe"
  belongs_to :taxeType, :class_name => "Taxe::Type", :foreign_key => "taxe_type_id"
	validates_numericality_of :percentage
	validates_numericality_of :basis
	validates_numericality_of :value
  validates_numericality_of :reduction
	validates_associated :taxeType, :class_name => "Taxe::Type", :foreign_key => "taxe_type_id"
end
