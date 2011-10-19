class Participant::Type < ActiveRecord::Base
  has_many :transactionParticipant, :class_name => "Transaction::Participant", :foreign_key => "participant_type_id", :dependent => :destroy
  belongs_to :participantPerson, :class_name => "Participant::Person", :foreign_key => "participant_person_id"
  validates_associated :participantPerson, :class_name => "Participant::Person", :foreign_key => "participant_person_id"
  validates_presence_of :participant_person_id
  validates_uniqueness_of :participant_person_id, :scope => :type
end
