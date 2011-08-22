class Transaction::Goods::Taxe < ActiveRecord::Base
  belongs_to :Value, :class_name => "Taxe::Value"
  belongs_to :Item, :class_name => "Transaction::Goods::Item"
end
