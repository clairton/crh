class Participant::Sender < Participant::Type
  belongs_to :Record, :class_name => "Transaction::Participant"
  has_one :Person, :class_name => "Participant::Person"
end
