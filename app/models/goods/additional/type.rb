class Goods::Additional::Type < ActiveRecord::Base
  has_many :Value, :class_name => "Goods::Additional::Value"
  validates_presence_of :name
end
