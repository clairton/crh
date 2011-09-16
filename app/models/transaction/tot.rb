class Transaction::Tot < ActiveRecord::Base
  belongs_to :transaction_record, :class_name => "Transaction::Record"
  has_one :goods_additional_value, :class_name => "Goods::Additional::Value"
  validates_presence_of :transaction_record_id, :goods_additional_value_id
  validates_associated :record, :class_name => "Transaction::Record"
  validates_associated :Value, :class_name => "Goods::Item::Additional::Value"
  validates_uniqueness_of :goods_additional_value_id
end
