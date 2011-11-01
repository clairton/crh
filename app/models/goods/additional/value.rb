class Goods::Additional::Value < ActiveRecord::Base
  belongs_to :goods_additional_type, :class_name => "Goods::Additional::Type",:foreign_key => "goods_additional_type_id"
  has_one :transaction_goods_additional, :class_name => "Transaction::Goods::Additional",:foreign_key => "goods_additional_value_id"
  has_one :transaction_tot, :class_name => "Transaction::Tot", :foreign_key => "goods_additional_value_id"
  validates_presence_of :goods_additional_type_id
  validates_associated :goods_additional_type, :class_name => "Goods::Additional::Type",:foreign_key => "goods_additional_type_id"
end

