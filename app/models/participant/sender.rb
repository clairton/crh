class Participant::Sender < Participant::Participant
  belongs_to :Record, :class_name => "Transaction::Participant"
  has_one :Person, :class_name => "Participant::Person"
end
