class Transaction::Tot < ActiveRecord::Base
  belongs_to :Record, :class_name => "Transaction::Record::Record"
  has_many :Value, :class_name => "Goods::Additional::Value"
  validates_presence_of :transaction_record_id, :goods_additional_value_id
  validates_associated :Record, :class_name => "Transaction::Record"
  validates_associated :Value, :class_name => "Goods::Item::Additional::Value"
  validates_uniqueness_of :goods_additional_value_id
end
