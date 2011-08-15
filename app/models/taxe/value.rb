class Taxe::Value < ActiveRecord::Base
	belongs_to :Taxe, :class_name => "Transaction::Taxe"
end
