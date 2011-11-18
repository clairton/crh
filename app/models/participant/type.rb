class Participant::Type < ActiveRecord::Base
  has_many :transaction_participant, :class_name => "Transaction::Participant", :foreign_key => "participant_type_id", :dependent => :destroy
  belongs_to :participant_person, :class_name => "Participant::Person", :foreign_key => "participant_person_id"
  validates_associated :participant_person, :class_name => "Participant::Person", :foreign_key => "participant_person_id"
  validates_presence_of :participant_person_id
  validates_uniqueness_of :participant_person_id, :scope => :type
end

