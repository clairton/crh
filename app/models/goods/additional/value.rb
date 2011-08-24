class Goods::Additional::Value < ActiveRecord::Base
  belongs_to :Type, :class_name => "Goods::Additional::Type"
  belongs_to :Additional, :class_name => "Transaction::Goods::Additional"
  belongs_to :Tot, :class_name => "Transaction::Tot"
  validates_presence_of :goods_additional_type_id
  validates_associated :Type, :class_name => "Goods::Additional::Type"
end
