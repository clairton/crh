class Goods::Additional::Value < ActiveRecord::Base
  belongs_to :Type, :class_name => "Goods::Additional::Type"
  belongs_to :Item, :class_name => "Transaction::Goods::Item"
  belongs_to :Tot, :class_name => "Transaction::Record::Tot"
  validates_presence_of :goods_additional_type_id
  validates_associated :Type, :class_name => "Goods::Additional::Type"
end
