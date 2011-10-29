class Transaction::Tot < ActiveRecord::Base
  belongs_to :transactionRecord, :class_name => "Transaction::record", :foreign_key => "transaction_record_id"
  belongs_to :goodsAdditionalValue, :class_name => "Goods::Additional::value", :foreign_key => "goods_additional_value_id", :dependent => :destroy
  validates_presence_of :transaction_record_id, :goods_additional_value_id
  validates_associated :transactionRecord, :class_name => "Transaction::record", :foreign_key => "transaction_record_id"
  validates_associated :goodsAdditionalValue, :class_name => "Goods::Additional::value", :foreign_key => "goods_additional_value_id", :dependent => :destroy
  validates_uniqueness_of :goods_additional_value_id
end

