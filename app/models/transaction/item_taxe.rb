class Transaction::ItemTaxe < ActiveRecord::Base
	belongs_to :Item, :class_name => "Transaction::Item"
	has_one :Value, :class_name => "Taxe::Value"
	validates_presence_of :transaction_item_id
	validates_presence_of :taxe_value_id
end
