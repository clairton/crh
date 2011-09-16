class Participant::Delivery < Participant::Type
  has_many :transaction_participant, :class_name => "Transaction::Participant"
  has_one :participant_person, :class_name => "Participant::Person"
end
