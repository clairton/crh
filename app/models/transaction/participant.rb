class Transaction::Participant < ActiveRecord::Base
  has_one :Delivery, :class_name => "Participant::Delivery"
  has_one :Sender, :class_name => "Participant::Sender"
  has_one :Issuer, :class_name => "Participant::Issuer"
  belongs_to :Record, :class_name => "Transaction::Record::Record"
end
