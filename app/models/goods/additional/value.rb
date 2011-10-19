class Goods::Additional::Value < ActiveRecord::Base
  belongs_to :goodsAdditionalType, :class_name => "Goods::Additional::Type",:foreign_key => "goods_additional_type_id"
  has_one :transactionGoodsAdditional, :class_name => "Transaction::Goods::Additional",:foreign_key => "goods_additional_value_id"
  has_one :transactionTot, :class_name => "Transaction::Tot", :foreign_key => "goods_additional_value_id"
  validates_presence_of :goods_additional_type_id
  validates_associated :goodsAdditionalType, :class_name => "Goods::Additional::Type",:foreign_key => "goods_additional_type_id"
end
