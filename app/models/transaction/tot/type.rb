class Transaction::Tot::Type < ActiveRecord::Base
  has_many :Value, :class_name => "Transaction::Tot::Value"
end
