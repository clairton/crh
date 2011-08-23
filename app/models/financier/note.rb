class Financier::Note < ActiveRecord::Base
	has_one :Financier, :class_name => "Transaction::Financier"
  validates_presence_of :original_value,:expiration_date,:creation_date,:name,:number
end
