class Goods::Item < ActiveRecord::Base
  validates_uniqueness_of :code
  belongs_to :Item, :class_name => "Transaction::Item"
end
