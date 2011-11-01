class Participant::Contact::Type < ActiveRecord::Base
  has_many :email, :class_name => "Participant::Contact::Email"
  has_many :address, :class_name => "Participant::Contact::Address"
  validates_presence_of :name
  validates_uniqueness_of :name
end

