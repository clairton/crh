class Goods::Additional::Type < ActiveRecord::Base
  has_many :goods_additional_value, :class_name => "Goods::Additional::Value", :dependent => :destroy, :foreign_key => "goods_additional_type_id"
  validates_presence_of :name
end

