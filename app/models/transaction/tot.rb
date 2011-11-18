class Transaction::Tot < ActiveRecord::Base
  belongs_to :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  belongs_to :goods_additional_value, :class_name => "Goods::Additional::Value", :foreign_key => "goods_additional_value_id", :dependent => :destroy
  validates_presence_of :transaction_record_id, :goods_additional_value_id
  validates_associated :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  validates_associated :goods_additional_value, :class_name => "Goods::Additional::Value", :foreign_key => "goods_additional_value_id"
  validates_uniqueness_of :goods_additional_value_id
end

