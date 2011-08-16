class Transaction::Item < ActiveRecord::Base
	has_one :Item, :class_name => "Goods::Item"
	belongs_to :Record, :class_name => "Transaction::Record"
	has_many :ItemTaxe, :class_name => "Transaction::ItemTaxe"
end
