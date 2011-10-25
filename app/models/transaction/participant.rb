class Transaction::Participant < ActiveRecord::Base
  belongs_to :participantType, :class_name => "Participant::type", :foreign_key => "participant_type_id"
  belongs_to :transactionRecord, :class_name => "Transaction::record", :foreign_key => "transaction_record_id"
  validates_presence_of :transaction_record_id,:participant_type_id
  validates_associated :transactionRecord, :class_name => "Transaction::record", :foreign_key => "transaction_record_id"
  validates_associated :participantType, :class_name => "Participant::type", :foreign_key => "participant_type_id"
end
