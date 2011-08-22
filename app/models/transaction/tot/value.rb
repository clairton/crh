class Transaction::Tot::Value < ActiveRecord::Base
  belongs_to :Record, :class_name => "Transaction::Record"
  belongs_to :Type, :class_name => "Transaction::Tot::Type"
end
