class Transaction::Record < ActiveRecord::Base
  has_many :Participant, :class_name => "Transaction::Participant"
end
