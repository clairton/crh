class Financier::Note < ActiveRecord::Base
	has_one :Financier, :class_name => "Transaction::Financier"
end
