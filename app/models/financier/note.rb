class Financier::Note < ActiveRecord::Base
	has_one :transaction_financier, :class_name => "Transaction::Financier"
  	validates_presence_of :original_value,:expiration_date,:creation_date,:name,:number
  	validates_uniqueness_of :number, :scope => :name
end
