class Participant::Contact::Type < ActiveRecord::Base
  has_many :Email, :class_name => "Participant::Contact::Email"
  has_many :address, :class_name => "Participant::Contact::address"
  validates_presence_of :name
  validates_uniqueness_of :name
end

