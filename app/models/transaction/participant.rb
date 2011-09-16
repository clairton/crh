class Transaction::Participant < ActiveRecord::Base
  belongs_to :particpant_delivery, :class_name => "Participant::Delivery"
  belongs_to :particpant_sender, :class_name => "Participant::Sender"
  belongs_to :particpant_issuer, :class_name => "Participant::Issuer"
  has_one :transaction_record, :class_name => "Transaction::Record"
  validates_presence_of :transaction_record_id,:participant_type_id
  validates_associated :transaction_ecord, :class_name => "Transaction::Record"
  #validação não deu certo, disse que Type não existe
  #validates_associated :Type, :class_name => "Participant::Type"
end
