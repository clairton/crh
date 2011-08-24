class Transaction::Participant < ActiveRecord::Base
  belongs_to :Delivery, :class_name => "Participant::Delivery"
  belongs_to :Sender, :class_name => "Participant::Sender"
  belongs_to :Issuer, :class_name => "Participant::Issuer"
  has_one :Record, :class_name => "Transaction::Record"
  validates_presence_of :transaction_record_id,:participant_type_id
  validates_associated :Record, :class_name => "Transaction::Record"
  validates_associated :Type, :class_name => "Participant::Type"
end
