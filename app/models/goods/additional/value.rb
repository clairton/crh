class Goods::Additional::Value < ActiveRecord::Base
  belongs_to :Type, :class_name => "Goods::Additional::Type"
end
