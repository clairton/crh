class Transaction::Xml < ActiveRecord::Base
	belongs_to :Record, :class_name => "Transaction::Record"
	validates_presence_of :xml, :message => "Deve Informar Um arquivo Xml"
	
end
