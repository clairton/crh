class Participant::Sender < Participant::Type
  has_many :Record, :class_name => "Transaction::Participant"
  has_one :Person, :class_name => "Participant::Person"
end
