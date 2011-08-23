class Participant::Person < ActiveRecord::Base
  has_many :Email, :class_name => "Participant::Contact::Email"
  has_many :Address, :class_name => "Participant::Contact::Address"
  belongs_to :Participant, :class_name => "Transaction::Participant"
  validates_presence_of :first_name,:code
end

