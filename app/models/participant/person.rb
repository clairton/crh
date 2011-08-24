class Participant::Person < ActiveRecord::Base
  has_many :Email, :class_name => "Participant::Contact::Email"
  has_many :Address, :class_name => "Participant::Contact::Address"
  validates_presence_of :first_name,:code
end

