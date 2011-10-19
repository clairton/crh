class Financier::Note < ActiveRecord::Base
	has_one :transactionFinancier, :class_name => "Transaction::Financier",:foreign_key => "financier_note_id", :dependent => :destroy
  validates_presence_of :original_value,:expiration_date,:creation_date,:name,:number
  validates_uniqueness_of :number, :scope => :name
end
