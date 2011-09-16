class Goods::Additional::Type < ActiveRecord::Base
  has_many :goods_additional_value, :class_name => "Goods::Additional::Value"
  validates_presence_of :name
end
