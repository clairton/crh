class Goods::Additional::Value < ActiveRecord::Base
  belongs_to :goods_additional_type, :class_name => "Goods::Additional::Type"
  belongs_to :transaction_goods_additional, :class_name => "Transaction::Goods::Additional"
  belongs_to :transaction_tot, :class_name => "Transaction::Tot"
  validates_presence_of :goods_additional_type_id
  validates_associated :goods_additional_typee, :class_name => "Goods::Additional::Type"
end
