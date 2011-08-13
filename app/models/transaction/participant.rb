class Transaction::Participant < ActiveRecord::Base
  belongs_to :Record, :class_name => "Transaction::Record"
  has_one :Person, :class_name => "Participant::Person"
end
